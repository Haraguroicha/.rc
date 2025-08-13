#!/usr/bin/env zsh

yt () {
	yt-dlp -4 -S ext:mp4:m4a \
		--concurrent-fragments 5 \
		--output '%(autonumber)s-%(title)s-%(id)s.%(format_id)s.%(ext)s' \
		--downloader aria2c \
		--downloader-args aria2c:"-j64 -s16 -x16 --file-allocation=none --remote-time --continue --summary-interval=5" \
		"$@"
}

yt-vod () {
	test -e "$(dirname $(readlink ~/.zshrc))/.rc.function/.yt.env" && source "$(dirname $(readlink ~/.zshrc))/.rc.function/.yt.env"
	[[ -n "${BROWSER_PROFILE}" ]] && yt --sub-langs live_chat --sub-format ass/srt/best --embed-subs --write-subs --write-auto-subs \
		--write-info-json --write-description --write-comments \
		--cookies-from-browser "${BROWSER_PROFILE}" \
		"$@"
}
