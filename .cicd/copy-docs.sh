#!/bin/bash
set -e

[[ -z "${CHANGE_BRANCH}" ]] && BRANCH=$BRANCH_NAME || BRANCH=$CHANGE_BRANCH

FOLDER_NAME=${BRANCH//[\/]/-}

[[ $1 = "master" ]] && OUTPUT_PATH=public || OUTPUT_PATH="public/${FOLDER_NAME}"

echo "Verifying $1"

mkdir -p ${OUTPUT_PATH}
echo "Created ${FOLDER_NAME} folder at ${OUTPUT_PATH}"

cp -r docs/* ${OUTPUT_PATH}

