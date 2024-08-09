#!/bin/bash

if [[ $# != 2 ]] || [[ $# == 1 && $XXFS_HOME]]; then
    echo "\tUsage: xxfs_ls.sh root_dir scan_dir\n"
    exit
fi

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/config.sh"

if [[ ! -z ${XXFS_HOME} ]]; then
    root_dir=$XXFS_HOME
    scan_dir=$1
else    
    root_dir=$1
    scan_dir=$2
fi

