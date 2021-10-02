#!/bin/bash -xe
# Until I get a better pipeline management figured out, this will work.

# Titlecards
docker run \
  -v "$(pwd)/titlecards:/out" \
  --mount type=bind,source="$(pwd)"/project-manifest.yml,target=/manifest.yml \
  speshak/video-tools /titlecards
