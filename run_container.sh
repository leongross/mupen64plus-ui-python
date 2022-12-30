#!/usr/bin/env bash

CONTAINER_RUNTIME="docker"
CONTAINER_NAME="mupen64plus-ui-python"

$CONTAINER_RUNTIME run \
        --rm \
        -e DISPLAY=$DISPLAY \
        -v /tmp/.X11-unix/:/tmp/.X11-unix/ \
        $CONTAINER_NAME

