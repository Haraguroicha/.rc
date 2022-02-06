#!/bin/zsh

r6-update-dcim () {
	[[ -z "$FOLDER" ]] && export FOLDER=EOS_DIGITAL

	(
		cd /Volumes/${FOLDER}/DCIM

		mvtodate () {
			d=$(exiftool -j "$1" | jq -r '.[].DateTimeOriginal | split(" ")[0] | gsub(":"; "")')
			[ ! -d "/Volumes/${FOLDER}/DCIM/${d}" ] && echo mkdir -p "/Volumes/${FOLDER}/DCIM/${d}" && mkdir -p "/Volumes/${FOLDER}/DCIM/${d}"
			echo mv "$1" "/Volumes/${FOLDER}/DCIM/${d}"
			mv "$1" "/Volumes/${FOLDER}/DCIM/${d}"
		}

		while read p
		do
			mvtodate $p
		done <<<"$(find . -maxdepth 2 -type f -ipath '*/1*canon/*')"
	)
}
