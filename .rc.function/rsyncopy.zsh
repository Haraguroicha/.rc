#!/usr/bin/env zsh

rsyncopy () {
    rsync -chavzP --stats $*
}
