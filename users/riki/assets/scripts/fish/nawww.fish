#!/usr/bin/env fish

set walls_dir "$HOME/.assets/walls"
set state_file "$HOME/.cache/nawww_cache"

set wallpapers (find "$walls_dir" -maxdepth 1 -type f \
    \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \
       -o -iname "*.gif" -o -iname "*.webp" \) \
    | sort)

set total (count $wallpapers)

if test $total -eq 0
    echo "No wallpapers found in $walls_dir"
    exit 1
end

set current_wall ""
if test -f "$state_file"
    set current_wall (cat "$state_file")
end

set current_index 0
for i in (seq 1 $total)
    if test "$wallpapers[$i]" = "$current_wall"
        set current_index $i
        break
    end
end

set next_index 0
if contains -- --init $argv
    if test $current_index -eq 0
        set next_index 1
    else
        set next_index $current_index
    end
else
    set next_index (math "$current_index % $total + 1")
end

set next_wall $wallpapers[$next_index]

awww img "$next_wall" \
    --transition-fps 144 \
    -t random \

ln -sf "$next_wall" "$HOME/.cache/current_wallpaper"
echo "$next_wall" > "$state_file"

echo "Wallpaper set to: "(basename "$next_wall")
