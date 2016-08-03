#!/bin/sh

# =============================================================================
# Author:         scps950707
# Email:          scps950707@gmail.com
# Created:        2016-07-15 21:36
# Last Modified:  2016-08-03 10:17
# Filename:       sortApt.sh
# =============================================================================

cd `git rev-parse --show-toplevel`
aptListTmp=`mktemp /tmp/aptList.XXXXX` || exit 1
aptList=aptPackage

cat $aptList | sort | uniq > $aptListTmp
cat $aptListTmp > $aptList
git add $aptList

rm -rf $aptListTmp
