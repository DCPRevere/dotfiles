#!/bin/bash
direction=$1
amount=$2
sink=$(get-current-sink.sh)

# pactl set-sink-volume 0 +10%
pactl set-sink-volume $sink ${direction}${amount}%
