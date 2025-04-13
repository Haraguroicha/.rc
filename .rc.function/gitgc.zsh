#!/usr/bin/env zsh

gitgc () {
	(
		cd "$(git root)"
		echo "Current at '$(pwd)'"
		\ls -lah .git/objects/pack
		find .git/objects
		git rp
		\ls -lah .git/objects/pack
		find .git/objects
	)
}

gitrgc () {
	(
		CD=$(pwd)
		for g in $(find . -type d -name .git | sed -e 's#/.git##g')
		do
			cd "$g"
			gitgc
			cd "$CD"
		done
	)
}
