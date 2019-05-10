#!/usr/bin/bash

random_file() {
    DIRECTORY="$1"
    find "$DIRECTORY" -type f | sort -R | tail -n 1
}

mail_str() {
    COUNT=$(find ~/.mail/gmail/Inbox/new/ -type f -printf . | wc -c)
    if [ "$COUNT" -gt 0 ]; then
        printf "mails: %d" "$COUNT"
    fi
}

date_str() {
    date "+%Y-%m-%d %H:%M"
}

while true; do
    LINE="$(mail_str) $(date_str)"
    TRIMED="$(echo -e "$LINE" | sed 's/^[[:space:]]//')"
    xsetroot -name "$TRIMED"
    sleep 1m
done &

xautolock -time 5 -locker slock &

WALLPAPERS="${HOME}/wp/"
if [ -d "$WALLPAPERS" ]; then
    feh --bg-max "$(random_file "$WALLPAPERS")"
fi

dunst &
firefox &

exec dwm-start
