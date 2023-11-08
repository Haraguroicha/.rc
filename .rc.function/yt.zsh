#!/usr/bin/env zsh

yt () {
	yt-dlp -4 -S ext:mp4:m4a --concurrent-fragments 5 --output '%(autonumber)s-%(title)s-%(id)s.%(format_id)s.%(ext)s' "$@"
}
