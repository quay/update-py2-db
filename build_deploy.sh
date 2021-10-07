#!/bin/bash

# AppSRE team CD

set -exv

CURRENT_DIR=$(dirname $0)

BASE_IMG="quayio-update-py2-db"
QUAY_IMAGE="quay.io/app-sre/${BASE_IMG}"
IMG="${BASE_IMG}:latest"

GIT_HASH=`git rev-parse --short=7 HEAD`

# build the image
docker build -t "${IMG}" -f Dockerfile .

# push the image to quay
skopeo copy --dest-creds "${QUAY_USER}:${QUAY_TOKEN}" \
    "docker-daemon:${IMG}" \
    "docker://${QUAY_IMAGE}:latest"

skopeo copy --dest-creds "${QUAY_USER}:${QUAY_TOKEN}" \
    "docker-daemon:${IMG}" \
    "docker://${QUAY_IMAGE}:${GIT_HASH}"

# push the image to a backup repository
BACKUP_BASE_IMG="${BASE_IMG}-backup"
BACKUP_IMAGE="${BACKUP_URL}/${BACKUP_BASE_IMG}"

skopeo copy --dest-creds "${BACKUP_USER}:${BACKUP_TOKEN}" \
    "docker-daemon:${IMG}" \
    "docker://${BACKUP_IMAGE}:latest"

skopeo copy --dest-creds "${BACKUP_USER}:${BACKUP_TOKEN}" \
    "docker-daemon:${IMG}" \
    "docker://${BACKUP_IMAGE}:${GIT_HASH}"
