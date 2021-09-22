#!/bin/bash

/opt/app/lighthouse \
     --debug-level "$DEBUG_LEVEL" \
     --network "$NETWORK" \
     account validator exit \
     --keystore "$LAUNCHPADDIR" \
     --beacon-node http://beacon:5052 
