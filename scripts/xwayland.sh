#!/usr/bin/env bash

xwayland-satellite &
sleep 5
xrandr --output DP-1 --primary
