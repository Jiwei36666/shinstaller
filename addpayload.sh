#!/bin/bash

# Check for payload format option (default is uuencode).
uuencode=1
if [[ "$1" == '--uuencode' ]]; then
        binary=0
        uuencode=1
        shift
fi

if [[ ! "$1" ]]; then
        echo "Usage: $0 [--uuencode] PAYLOAD_FILE"
        exit 1
fi

if [[ $uuencode -ne 0 ]]; then
        # Append uuencoded data.
        cat install.sh.in > eds_install.sh
        echo "PAYLOAD:" >> eds_install.sh

        cat $1 | uuencode - >>eds_install.sh
        chmod a+x eds_install.sh
fi
