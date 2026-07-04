niri msg action power-off-monitors
brightnessctl -sd platform::kbd_backlight set 0%
wpctl set-mute @DEFAULT_AUDIO_SINK@ 1
playerctl -a pause
pidof hyprlock || hyprlock &
sleep 4
lid-is-closed && systemctl suspend