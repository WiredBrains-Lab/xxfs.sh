#!/bin/bash

if [ $# != 2 ] && { [ $# == 1 ] && [ -z "$XXFS_HOME" ]; }; then
    echo "    Usage: xxfs_scan.sh root_dir scan_dir
    
    Or, set \$XXFS_HOME to the 'root_dir'\n"
    exit
fi

DIR="${BASH_SOURCE%/*}"
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi
. "$DIR/config.sh"

if [ ! -z ${XXFS_HOME} ]; then
    root_dir=$XXFS_HOME
    scan_dir=$1
else    
    root_dir=$1
    scan_dir=$2
fi

xxh_copy() {
    h=`xxh $1`
    hfname=`xxh_fname $h`

    if [ ! -L $hfname ]; then
        abspath=`realpath $1`
        echo "Linking $abspath to $hfname"
        mkdir -p `dirname $hfname`
        ln -s $abspath $hfname
    fi
}

find $scan_dir -type f | while read file; do xxh_copy "$file"; done