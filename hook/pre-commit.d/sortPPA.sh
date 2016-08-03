#!/bin/sh

# ==========================================================================
# Author:         scps950707
# Email:          scps950707@gmail.com
# Created:        2016-08-03 10:15
# Last Modified:  2016-08-03 10:20
# Filename:       sortPPA.sh
# ==========================================================================

cd `git rev-parse --show-toplevel`
ppaListTmp=`mktemp /tmp/ppaList.XXXXX` || exit 1
ppaList=ppaPackage

cat $ppaList | sort | uniq > $ppaListTmp
cat $ppaListTmp > $ppaList
git add $ppaList

rm -rf $ppaListTmp
