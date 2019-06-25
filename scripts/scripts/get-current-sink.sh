#!/bin/bash
pactl list short sinks | grep -E "(RUNNING|IDLE)" | awk '{print $1}'
