#!/bin/bash

set -o xtrace
set -o verbose 

/opt/app/lighthouse \
     --debug-level "$DEBUG_LEVEL" \
     --network "$NETWORK" \
     account validator import \
     --datadir "$DATADIR" \
     --directory "$LAUNCHPADDIR"
