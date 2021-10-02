FROM python:3-buster

RUN apt-get update && \
    apt-get install -y \
        ffmpeg \
        fonts-liberation \
        gpsbabel \
        imagemagick \
        jq \
        xfonts-75dpi \
        xfonts-base && \
    TEMP_DEB="$(mktemp)" && \
    wget -q -O "$TEMP_DEB" 'https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.buster_amd64.deb' && \
    dpkg -i "$TEMP_DEB" && \
    rm -f "$TEMP_DEB" && \
    rm -rf /var/lib/apt/lists/* && \
    pip install git+https://github.com/juanmcasillas/gopro2gpx && \
    pip install git+https://github.com/Seangottarun/GPXOverlay

RUN wget https://github.com/mikefarah/yq/releases/download/v4.13.3/yq_linux_amd64 -O /usr/bin/yq &&\
    chmod +x /usr/bin/yq

COPY ./rotate.sh /rotate
COPY ./titlecards.sh /titlecards
