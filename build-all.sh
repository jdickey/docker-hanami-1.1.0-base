#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
set -vx

cd 2.4.2 && bash ./build.sh && cd ..
cd 2.4.3 && bash ./build.sh && cd ..
cd 2.4.4 && bash ./build.sh && cd ..
cd 2.5.0 && bash ./build.sh && cd ..
cd 2.5.1 && bash ./build.sh && cd ..
ALL_IMAGES=`docker image ls jdickey/hanami-1.1.0-base --format '{{.ID}}\t{{.Repository}}:{{.Tag}}' | sort | grep hanami`
echo $ALL_IMAGES | cut -f 2 | sort
echo
echo "There are `echo $ALL_IMAGES | wc -l` images"
