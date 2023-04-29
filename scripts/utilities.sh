#!/bin/bash -e

# Utilities Library. usage: source utilities.sh

function log() {
    local log_level=${1}
    local log_message=${@:2}
    echo "$log_level: $LOG_ID: $log_message" >&2
}