#!/usr/bin/env bash

SP_DEST="org.mpris.MediaPlayer2.spotify"
SP_PATH="/org/mpris/MediaPlayer2"
SP_MEMB="org.mpris.MediaPlayer2.Player"

SPOTIFY_PID="$(pidof -s spotify || pidof -s .spotify-wrapped)"


function sp-metadata {
  # Prints the currently playing track in a parseable format.

  dbus-send                                                                   \
  --print-reply                                  `# We need the reply.`       \
  --dest=$SP_DEST                                                             \
  $SP_PATH                                                                    \
  org.freedesktop.DBus.Properties.Get                                         \
  string:"$SP_MEMB" string:'Metadata'                                         \
  | grep -Ev "^method"                           `# Ignore the first line.`   \
  | grep -Eo '("(.*)")|(\b[0-9][a-zA-Z0-9.]*\b)' `# Filter interesting fiels.`\
  | sed -E '2~2 a|'                              `# Mark odd fields.`         \
  | tr -d '\n'                                   `# Remove all newlines.`     \
  | sed -E 's/\|/\n/g'                           `# Restore newlines.`        \
  | sed -E 's/(xesam:)|(mpris:)//'               `# Remove ns prefixes.`      \
  | sed -E 's/^"//'                              `# Strip leading...`         \
  | sed -E 's/"$//'                              `# ...and trailing quotes.`  \
  | sed -E 's/"+/|/'                             `# Regard "" as seperator.`  \
  | sed -E 's/ +/ /g'                            `# Merge consecutive spaces.`
}

if [[ -z "$SPOTIFY_PID" ]]; then
  exit 1
else
  ARTIST=$(sp-metadata | grep "artist" | sed 's/.*|//' | awk -v len=60 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }' 2>&1)
  TITLE=$(sp-metadata | grep "title"  | sed 's/.*|//' | awk -v len=60 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }'  2>&1)

  echo "$ARTIST - $TITLE "
fi
