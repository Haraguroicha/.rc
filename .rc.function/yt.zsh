#!/usr/bin/env zsh

yt () {
	yt-dlp -4 -S ext:mp4:m4a \
		--concurrent-fragments 5 \
		--output '%(autonumber)s-%(title)s-%(id)s.%(format_id)s.%(ext)s' \
		--downloader aria2c \
		--downloader-args aria2c:"-j64 -s16 -x16 --file-allocation=none --remote-time --continue --summary-interval=5" \
		"$@"
}
