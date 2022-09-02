#!/bin/zsh

r6-update-dcim () {
	[[ -z "$FOLDER" ]] && export FOLDER=EOS_DIGITAL

	[ ! -d "/Volumes/${FOLDER}/DCIM" ] && echo "DCIM folder or ${FOLDER} card doesn't exists"
	[ -d "/Volumes/${FOLDER}/DCIM" ] && (
		cd /Volumes/${FOLDER}/DCIM

		mvtodate () {
			if [ -n "$1" ]; then
				d=$(exiftool -j "$1" | jq -r '.[].DateTimeOriginal | split(" ")[0] | gsub(":"; "")')
				[ ! -d "/Volumes/${FOLDER}/DCIM/${d}" ] && echo mkdir -p "/Volumes/${FOLDER}/DCIM/${d}" && mkdir -p "/Volumes/${FOLDER}/DCIM/${d}"
				echo mv "$1" "/Volumes/${FOLDER}/DCIM/${d}"
				mv "$1" "/Volumes/${FOLDER}/DCIM/${d}"
			else
				echo "empty imput"
			fi
		}

		list="$(find . -maxdepth 2 -type f -ipath '*/1*canon/*')"
		total=$(echo "${list}" | wc -l | sed 's/ //g')
		processes=0

		while read p
		do
			if [ -n "$p" ]; then
				processes=$(($processes + 1))
				echo -ne "Process ${processes}/${total}\t-> "
				mvtodate $p
			fi
		done <<<"${list}"
	)
}
