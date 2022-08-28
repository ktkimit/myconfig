fd . ~/ -E '*.git' | rofi -threads 0 -width 100 -dmenu -i -p "locate:" | xargs -r -0 xdg-open

# locate -i "home" | rofi -threads 0 -width 100 -dmenu -i -p "locate:" | xargs -r -0 xdg-open
