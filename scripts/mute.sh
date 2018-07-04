#!/bin/bash
sink=$(get-current-sink.sh)

# pactl set-sink-volume 0 +10%
pactl set-sink-mute $sink toggle
