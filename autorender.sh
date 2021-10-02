#!/bin/bash

ls -l /in

export NODE_OPTIONS="--max-old-space-size=8192"

node autorender/dist/index.js
