#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
set -vx

REPO_NAME=jdickey/hanami-1.1.0-base
docker build --squash --tag $REPO_NAME:2.4.4-no-qt --file ./jessie/no-qt/Dockerfile .
docker build --squash --tag $REPO_NAME:2.4.4 --file ./jessie/Dockerfile .
docker build --squash --tag $REPO_NAME:2.4.4-slim-no-qt --file ./jessie/slim/no-qt/Dockerfile .
docker build --squash --tag $REPO_NAME:2.4.4-slim --file ./jessie/slim/Dockerfile .

docker tag $REPO_NAME:2.4.4 $REPO_NAME:2.4
docker tag $REPO_NAME:2.4.4 $REPO_NAME:2.4-jessie
docker tag $REPO_NAME:2.4.4 $REPO_NAME:2.4.4-jessie

docker tag $REPO_NAME:2.4.4-no-qt $REPO_NAME:2.4-no-qt
docker tag $REPO_NAME:2.4.4-no-qt $REPO_NAME:2.4-jessie-no-qt
docker tag $REPO_NAME:2.4.4-no-qt $REPO_NAME:2.4.4-jessie-no-qt

docker tag $REPO_NAME:2.4.4-slim $REPO_NAME:2.4-slim
docker tag $REPO_NAME:2.4.4-slim $REPO_NAME:2.4-jessie-slim
docker tag $REPO_NAME:2.4.4-slim $REPO_NAME:2.4.4-jessie-slim

docker tag $REPO_NAME:2.4.4-slim-no-qt $REPO_NAME:2.4-slim-no-qt
docker tag $REPO_NAME:2.4.4-slim-no-qt $REPO_NAME:2.4-jessie-slim-no-qt
docker tag $REPO_NAME:2.4.4-slim-no-qt $REPO_NAME:2.4.4-jessie-slim-no-qt
unset REPO_NAME
