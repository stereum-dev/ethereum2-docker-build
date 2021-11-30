#!/bin/bash

set -o xtrace
set -o verbose 

/opt/app/lighthouse \
     --debug-level "debug" \
     --network "$NETWORK" \
     account validator import \
     --datadir "$DATADIR" \
     --directory "$LAUNCHPADDIR"
