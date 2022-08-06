#!/bin/env sh

LAPTOP_DISPLAY="eDP-1"
MID_DISPLAY="HDMI-A-1"
SIDE_DISPLAY="DP-3"

wlr-randr --output ${LAPTOP_DISPLAY} --pos 0,700 --output ${MID_DISPLAY} --pos 1920,700 --output ${SIDE_DISPLAY} --pos 5360,0 --transform 270

