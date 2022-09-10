#!/bin/sh
draw() {
  if [ -n "$FIFO_UEBERZUG" ]; then
    path="$(printf '%s' "$1" | sed 's/\\/\\\\/g;s/"/\\"/g')"
    printf '{"action": "add", "identifier": "preview", "x": %d, "y": %d, "width": %d, "height": %d, "scaler": "contain", "scaling_position_x": 0.5, "scaling_position_y": 0.5, "path": "%s"}\n' \
      "$4" "$5" "$2" "$3" "$1" >"$FIFO_UEBERZUG"
  fi
  exit 1
}

hash() {
  printf '%s/.cache/lf/%s' "$HOME" \
    "$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$1")" | sha256sum | awk '{print $1}')"
}

cache() {
  if [ -f "$1" ]; then
    draw "$@"
  fi
}

file="$1"
shift

if [ -n "$FIFO_UEBERZUG" ]; then
  case "$(file -Lb --mime-type -- "$file")" in
    image/*)
      orientation="$(identify -format '%[EXIF:Orientation]\n' -- "$file")"
      if [ -n "$orientation" ] && [ "$orientation" != 1 ]; then
        cache="$(hash "$file").jpg"
        cache "$cache" "$@"
        convert -- "$file" -auto-orient "$cache"
        draw "$cache" "$@"
      else
        draw "$file" "$@"
      fi
      ;;
    video/*)
      cache="$(hash "$file").jpg"
      cache "$cache" "$@"
      ffmpegthumbnailer -i "$file" -o "$cache" -s 0
      draw "$cache" "$@"
      ;;
    # text/html) 
    #   lynx -display_charset=utf-8 -dump "$@"
    #   ;;
    text/troff) 
      man ./ "$@" | col -b 
      ;;
    text/* | */xml | application/json)
      bat --color=always "$file" "$@"
      ;;
    application/zip) 
      atool --list -- "$@"
      ;;
    # */pdf)
    #   if [ -n "$FIFO_UEBERZUG" ]; then
    #     cache="$(hash "$file")"
    #     cache "$cache.jpg" "$@"
    #     pdftoppm -f 1 -l 1 \
    #     -scale-to-x "$default_x" \
    #     -scale-to-y -1 \
    #     -singlefile \
    #     -jpeg \
    #     -- "$file" "$cache"
    #     draw "$cache.jpg" "$@"
    #   else
    #     pdftotext -nopgbrk -q -- "$file" -
    #     exit 0
    #   fi
    #   ;;

    # audio/* | application/octet-stream) mediainfo "$1" || exit 1 ;;
    # */pdf)
    #   CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/lf/thumb.$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$1")" | sha256sum | cut -d' ' -f1)"
    #   [ ! -f "$CACHE.jpg" ] && pdftoppm -jpeg -f 1 -singlefile "$1" "$CACHE"
    #   image "$CACHE.jpg" "$2" "$3" "$4" "$5" "$1"
    #   ;;
    # *opendocument*) odt2txt "$1" ;;
    # application/pgp-encrypted) gpg -d -- "$1" ;;
  esac
fi

file -Lb -- "$1" | fold -s -w "$width"
exit 0
