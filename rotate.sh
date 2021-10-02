#!/bin/bash -xe
rotate_deg=${1:-180}

for vid in /in/*.MP4; do
  # To avoid reencoding the actual video, embed rotation metadata
  ffmpeg \
    -i "${vid}" \
    -map_metadata 0 \
    -metadata:s:v rotate="${rotate_deg}" \
    -codec copy \
    "${vid/in/out}"
done
