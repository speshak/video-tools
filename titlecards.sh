#!/bin/bash -xe

manifest=${1:-/manifest.yml}

# TODO: ffprobe to get size
video_width=3840
video_height=2160
video_size="${video_width}x${video_height}"


###
# Create a image filename for the titlecard
function title_to_filename {
  title=$1

  echo "/out/title-${title// /_}.png"
}


###
# Create a titlecard for a string
function produce_title {
  title="$1"

  filename=$(title_to_filename "$title")

  convert \
    -size "${video_size}" \
    xc:transparent \
    -font Liberation-Sans-Bold \
    -pointsize 120 \
    -fill '#abaaa9' \
    -draw "text 150,$(( video_height - 400 )) '${title}'" \
    "${filename}"
}



####
# Parse the title_card section out of a project manifest and generate cards for
# each entry.
IFS=$'\n'
for title in $(yq eval ".title_cards" "$manifest" | sed 's/- //'); do
  produce_title "$title"
done
