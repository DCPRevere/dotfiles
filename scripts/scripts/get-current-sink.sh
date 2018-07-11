#!/bin/bash
pactl list short sinks | grep RUNNING | awk '{print $1}'
