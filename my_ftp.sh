#!/bin/bash

#
# 簡易ファイル転送
#

readonly CMDNAME=`basename $0`
if [ $# -ne 4 ]; then
    echo "Usage: $CMDNAME user host fromDir toDir" 1>&2
    exit 1
fi

readonly user=$1
readonly host=$2
readonly fromDir=`dirname $3`
readonly fromFile=`basename $3`
readonly toDir=$4

echo ${fromDir}
echo ${fromFile}

tar czf - -C ${fromDir} ${fromFile} | ssh ${user}@${host} "tar zxvf - -C ${toDir}"

#受信そのうち
#ssh ${user}@${host} "tar czf - -C ${fromDir} ${fromFile}" | tar zxvf - -C ${toDir}
