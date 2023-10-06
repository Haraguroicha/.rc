#!/usr/bin/env zsh

r6-update-dcim () {
	[[ -z "$FOLDER" ]] && export FOLDER=EOS_DIGITAL
	TARGET_FOLDER="/Volumes/${FOLDER}/DCIM"

	[ ! -d "${TARGET_FOLDER}" ] && echo "DCIM folder or ${FOLDER} card doesn't exists"
	[ -d "${TARGET_FOLDER}" ] && (
		cd "${TARGET_FOLDER}"

		mvtodate () {
			if [ -n "$1" ]; then
				d=$(exiftool -j "$1" | jq -r '.[].DateTimeOriginal | split(" ")[0] | gsub(":"; "")')
				[ ! -d "${TARGET_FOLDER}/${d}" ] && echo mkdir -p "${TARGET_FOLDER}/${d}" && mkdir -p "${TARGET_FOLDER}/${d}"
				echo mv "$1" "${TARGET_FOLDER}/${d}"
				mv "$1" "${TARGET_FOLDER}/${d}"
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
