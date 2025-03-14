#!/usr/bin/env zsh

gitgc () {
	(
		cd "$(git rev-parse --show-toplevel)"
		\ls -lah .git/objects/pack
		find .git/objects
		git rp
		\ls -lah .git/objects/pack
		find .git/objects
	)
}
