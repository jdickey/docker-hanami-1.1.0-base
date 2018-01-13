#!/bin/bash
cd 2.4 && bash ./build.sh && cd ..
cd 2.5.0 && bash ./build.sh && cd ..
ALL_IMAGES=`docker image ls jdickey/hanami-1.1.0-base --format '{{.ID}}\t{{.Repository}}:{{.Tag}}' | sort`
echo $ALL_IMAGES
echo
echo "There are `echo $ALL_IMAGES | wc -l` images"
