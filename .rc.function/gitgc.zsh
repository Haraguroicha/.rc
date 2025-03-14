#!/usr/bin/env zsh

gitgc () {
	(
		cd "$(git root)"
		\ls -lah .git/objects/pack
		find .git/objects
		git rp
		\ls -lah .git/objects/pack
		find .git/objects
	)
}
