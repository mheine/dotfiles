#!/bin/bash
outputs=$(xrandr | grep '\Wconnected' | awk '{ print $1 }')
off_outputs=$(xrandr | grep '\Wdisconnected' | awk '{ print $1 }')
outputcount=$(echo "$outputs" | wc -l)

for output in $outputs; do
    if [[ $output =~ ^LVDS.*$ ]] || [[ $output =~ ^eDP.*$ ]]; then
        main=$output
        break
    fi
done

if [ "$outputcount" -gt 1 ]; then
    echo "$main: auto primary"
    xrandr --output $main --primary --auto
    previous=$main
    for output in $outputs; do
        if [[ ! $output =~ ^LVDS.*$ ]] && [[ ! $output =~ ^eDP.*$ ]]; then
            echo "xrandr $output: auto (above $previous)"
            xrandr --output $output --auto --above $previous
            previous=$output
        fi
    done
    for output in $off_outputs; do
        echo "$output: off"
        xrandr --output $output --off
    done
else
    if [ "$main" != "" ]; then
        echo "$main: auto primary"
        xrandr --output $main --auto --primary
        for output in $off_outputs; do
            echo "$output: off"
            xrandr --output $output --off
        done
    else
        echo "Couldn't find any output starting with \"LVDS\" or eDP!"
        exit 1
    fi
fi
