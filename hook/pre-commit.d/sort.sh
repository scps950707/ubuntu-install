#!/bin/sh

# ==========================================================================
# Author:         scps950707
# Email:          scps950707@gmail.com
# Created:        2017-02-11 15:45
# Last Modified:  2017-02-11 16:44
# Filename:       sort.sh
# ==========================================================================

for p in package/*
do
    tmp=`mktemp /tmp/$(basename $p).XXXXX` || exit 1
    cat $p | sort | uniq > $tmp
    cat $tmp > $p
    git add $p
    rm -rf $tmp
done
