#!/bin/bash

if [[ $# != 2 ]] || [[ $# == 1 && $XXFS_HOME]]; then
    echo "\tUsage: xxfs_ls.sh [root_dir] scan_dir hash_to_find\n"
    exit
fi

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/config.sh"

if [[ ! -z ${XXFS_HOME} ]]; then
    root_dir=$XXFS_HOME
    scan_dir=$1
    find_hash=$2
else    
    root_dir=$1
    scan_dir=$2
    find_hash=$3
fi

find $scan_dir -type f -exec xxh128sum '{}' \; | grep $find_hash | awk '{print $2}'