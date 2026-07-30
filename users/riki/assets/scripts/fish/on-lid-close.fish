#!/usr/bin/env fish

set -l external_connected (niri msg --json outputs | jq -e '[.[] | select(.name != "eDP-1")] | length > 0')

if test "$external_connected" = "true"
    niri msg output eDP-1 off
    brightnessctl -sd platform::kbd_backlight set 0%
else
    niri msg action power-off-monitors
    brightnessctl -sd platform::kbd_backlight set 0%
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 1
    playerctl -a pause
    pidof hyprlock || hyprlock &
    sleep 4
    lid-is-closed && systemctl suspend
end