#!/bin/bash

IGNORE_FILE="$HOME/.config/skhd/skhd-ignore-apps.txt"
CURRENT_APP=$(yabai -m query --windows --window | jq -r '.app')

add() {
  mkdir -p "$(dirname "$IGNORE_FILE")"  # создаём папку, если нет
  if ! grep -Fxq "$CURRENT_APP" "$IGNORE_FILE" 2>/dev/null; then
    echo "$CURRENT_APP" >> "$IGNORE_FILE"
  fi
}

remove() {
  if [ -f "$IGNORE_FILE" ]; then
    # macOS sed требует -i '' для inplace редактирования
    sed -i '' "/^$CURRENT_APP$/d" "$IGNORE_FILE"
  fi
}

case "$1" in
  add)
    add
    ;;
  remove)
    remove
    ;;
  *)
    echo "Usage: $0 {add|remove}"
    exit 1
    ;;
esac

