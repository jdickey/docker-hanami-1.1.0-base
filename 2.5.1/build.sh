#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
set -vx

REPO_NAME=jdickey/hanami-1.1.0-base

docker build --squash --tag $REPO_NAME:2.5.1-no-qt --file ./stretch/no-qt/Dockerfile .
docker build --squash --tag $REPO_NAME:2.5.1 --file ./stretch/Dockerfile .
docker build --squash --tag $REPO_NAME:2.5.1-slim-no-qt --file ./stretch/slim/no-qt/Dockerfile .
docker build --squash --tag $REPO_NAME:2.5.1-slim --file ./stretch/slim/Dockerfile .
docker build --squash --tag $REPO_NAME:2.5.1-alpine-no-qt --file ./alpine/no-qt/Dockerfile .
docker build --squash --tag $REPO_NAME:2.5.1-alpine --file ./alpine/Dockerfile .

docker tag $REPO_NAME:2.5.1 $REPO_NAME:latest
docker tag $REPO_NAME:2.5.1 $REPO_NAME:2
docker tag $REPO_NAME:2.5.1 $REPO_NAME:2.5
# docker tag $REPO_NAME:2.5.1 $REPO_NAME:2.5.1
docker tag $REPO_NAME:2.5.1 $REPO_NAME:stretch
docker tag $REPO_NAME:2.5.1 $REPO_NAME:2-stretch
docker tag $REPO_NAME:2.5.1 $REPO_NAME:2.5-stretch
docker tag $REPO_NAME:2.5.1 $REPO_NAME:2.5.1-stretch

docker tag $REPO_NAME:2.5.1-no-qt $REPO_NAME:2-no-qt
docker tag $REPO_NAME:2.5.1-no-qt $REPO_NAME:2.5-no-qt
# docker tag $REPO_NAME:2.5.1-no-qt $REPO_NAME:2.5.1-no-qt
docker tag $REPO_NAME:2.5.1-no-qt $REPO_NAME:2-stretch-no-qt
docker tag $REPO_NAME:2.5.1-no-qt $REPO_NAME:2.5-stretch-no-qt
docker tag $REPO_NAME:2.5.1-no-qt $REPO_NAME:2.5.1-stretch-no-qt
docker tag $REPO_NAME:2.5.1-no-qt $REPO_NAME:stretch-no-qt

docker tag $REPO_NAME:2.5.1-slim $REPO_NAME:2-slim
docker tag $REPO_NAME:2.5.1-slim $REPO_NAME:2.5-slim
# docker tag $REPO_NAME:2.5.1-slim $REPO_NAME:2.5.1-slim
docker tag $REPO_NAME:2.5.1-slim $REPO_NAME:2-stretch-slim
docker tag $REPO_NAME:2.5.1-slim $REPO_NAME:2.5-stretch-slim
docker tag $REPO_NAME:2.5.1-slim $REPO_NAME:2.5.1-stretch-slim
docker tag $REPO_NAME:2.5.1-slim $REPO_NAME:stretch-slim

docker tag $REPO_NAME:2.5.1-slim-no-qt $REPO_NAME:2-slim-no-qt
docker tag $REPO_NAME:2.5.1-slim-no-qt $REPO_NAME:2.5-slim-no-qt
# docker tag $REPO_NAME:2.5.1-slim-no-qt $REPO_NAME:2.5.1-slim-no-qt
docker tag $REPO_NAME:2.5.1-slim-no-qt $REPO_NAME:2-stretch-slim-no-qt
docker tag $REPO_NAME:2.5.1-slim-no-qt $REPO_NAME:2.5-stretch-slim-no-qt
docker tag $REPO_NAME:2.5.1-slim-no-qt $REPO_NAME:2.5.1-stretch-slim-no-qt
docker tag $REPO_NAME:2.5.1-slim-no-qt $REPO_NAME:stretch-slim-no-qt

docker tag $REPO_NAME:2.5.1-alpine $REPO_NAME:2.5-alpine
docker tag $REPO_NAME:2.5.1-alpine $REPO_NAME:2-alpine
# docker tag $REPO_NAME:2.5.1-alpine $REPO_NAME:alpine

docker tag $REPO_NAME:2.5.1-alpine-no-qt $REPO_NAME:2.5-alpine-no-qt
docker tag $REPO_NAME:2.5.1-alpine-no-qt $REPO_NAME:2-alpine-no-qt
# docker tag $REPO_NAME:2.5.1-alpine-no-qt $REPO_NAME:alpine-no-qt
unset REPO_NAME
