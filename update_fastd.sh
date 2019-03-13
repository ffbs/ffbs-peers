#!/bin/bash
set -ex
cd /home/fastd_peers
rev=$(git rev-parse HEAD)
echo $rev
git pull
new_rev=$(git rev-parse HEAD)
if [[ $rev != $new_rev ]]
  then
  for pid in $(pidof fastd); do
    /bin/kill -HUP $pid > /dev/null
    sleep 5
  done
  exit 0
else
  exit 0
fi
