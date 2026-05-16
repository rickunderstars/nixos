#!/usr/bin/env fish

if test (hostname) != "case"
    exit 0
end

set MONITOR   "HDMI-A-1"
set POS_TOUCH "-1920x0"
set POS_GAP   "-3000x0"

set STATE_FILE "/tmp/monitor-gap-state"

if test -f $STATE_FILE
    hyprctl keyword monitor "$MONITOR, 1920x1080@75, $POS_TOUCH, 1"
    rm $STATE_FILE
    dunstify "Monitor" "monitors merged"
else
    hyprctl keyword monitor "$MONITOR, 1920x1080@75, $POS_GAP, 1"
    touch $STATE_FILE
    dunstify "Monitor" "monitors split"
end

sleep 0.5
pkill waybar