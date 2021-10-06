#!/bin/bash
set -exv

BASE_IMG="quayio-update-py2-db"

IMG="${BASE_IMG}:pr-check"

docker build -t "${IMG}" -f Dockerfile .
