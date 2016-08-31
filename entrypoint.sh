#!/bin/bash

set -eo pipefail

if [ "$1" == "mecab" ]; then
    shift
    su-exec mecab mecab "$@"
fi

exec "$@"