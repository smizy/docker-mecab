#!/bin/bash

set -eo pipefail

if [ "$1" == "mecab" ]; then
    shift
    exec su-exec mecab mecab "$@"
fi

exec "$@"