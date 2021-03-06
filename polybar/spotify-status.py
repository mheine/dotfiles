#!/bin/python

import sys
import dbus
import argparse
import subprocess

def MPDisPlaying():
    result = subprocess.run(['pgrep', '-x', 'mpd'], stdout=subprocess.PIPE)
    pgrepOutput = result.stdout.decode('utf-8')

    if pgrepOutput:
        result = subprocess.run(['mpc', 'status'], stdout=subprocess.PIPE)
        mpcOutput = result.stdout.decode('utf-8')
        
        if "[playing]" in mpcOutput:
            return True

    return False

def printMPDsong():
    result = subprocess.run(['mpc', '-f',  '[%title% - %artist%]'], stdout=subprocess.PIPE)
    mpcOutput = result.stdout.decode('utf-8')
    label = mpcOutput.split("[playing]", 1)[0].rstrip()
    print(label)


parser = argparse.ArgumentParser()
parser.add_argument(
    '-t',
    '--trunclen',
    type=int,
    metavar='trunclen'
)
parser.add_argument(
    '-f',
    '--format',
    type=str,
    metavar='custom format',
    dest='custom_format'
)
parser.add_argument(
    '-p',
    '--playpause',
    type=str,
    metavar='play-pause indicator',
    dest='play_pause'
)

args = parser.parse_args()

if MPDisPlaying():
    printMPDsong() 
    quit()


# Default parameters
output = '{play_pause} {artist} - {song}'
trunclen = 35
play_pause = "," # first character is play, second is paused

# parameters can be overwritten by args
if args.trunclen is not None:
    trunclen = args.trunclen
if args.custom_format is not None:
    output = args.custom_format
if args.play_pause is not None:
    play_pause = args.play_pause

try:
    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object(
        'org.mpris.MediaPlayer2.spotify',
        '/org/mpris/MediaPlayer2'
    )

    spotify_properties = dbus.Interface(
        spotify_bus,
        'org.freedesktop.DBus.Properties'
    )

    metadata = spotify_properties.Get('org.mpris.MediaPlayer2.Player', 'Metadata')
    status = spotify_properties.Get('org.mpris.MediaPlayer2.Player', 'PlaybackStatus')

    play_pause = play_pause.split(',')
    if status == 'Playing':
        play_pause = play_pause[0]
    elif status == 'Paused':
        play_pause = play_pause[1]
    else:
        play_pause = str()

    artist = metadata['xesam:artist'][0]
    song = metadata['xesam:title']


    if len(song) > trunclen:
        song = song[0:trunclen]
        song += '...' 
        if ('(' in song) and (')' not in song):
            song += ')'
    
    if "- " in song:
        song = song.replace("- ", "[", 1)
        song += "]"

    # Python3 uses UTF-8 by default. 
    if sys.version_info.major == 3:
        print(output.format(artist=artist, song=song, play_pause=play_pause))
    else:
        print(output.format(artist=artist, song=song, play_pause=play_pause).encode('UTF-8'))
except Exception as e:
    if isinstance(e, dbus.exceptions.DBusException):
        print('')
    else:
        print(e)
