#!/bin/bash
set -ex
cd /home/fastd_peers
rev=$(git rev-parse HEAD)
echo $rev
git pull
new_rev=$(git rev-parse HEAD)
if [[ $rev != $new_rev ]]
  then
  /bin/kill -HUP $(pidof fastd) > /dev/null
  exit 0
else
  exit 0
fi
