#!/usr/bin/env zsh

progress () {
	$(brew --prefix progress)/bin/progress -MW1 "$@"
}
