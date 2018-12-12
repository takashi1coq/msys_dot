#!/bin/bash

#
# 簡易ファイル転送
#

readonly CMDNAME=`basename $0`
if [ $# -ne 5 ]; then
    echo "Usage: $CMDNAME user host flg fromDir toDir" 1>&2
    exit 1
fi

readonly user=$1
readonly host=$2
readonly fromDir=`dirname $4`
readonly fromFile=`basename $4`
readonly toDir=$5
readonly flg=$3

echo ${fromDir}
echo ${fromFile}

if [ ${flg} -eq 0 ]; then
    tar czf - -C ${fromDir} ${fromFile} | ssh ${user}@${host} "tar zxvf - -C ${toDir}"
    exit 1
else
    ssh ${user}@${host} "tar czf - -C ${fromDir} ${fromFile}" | tar zxvf - -C ${toDir}
    exit 1
fi

