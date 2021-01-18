#!/bin/bash

/opt/app/lighthouse \
     --debug-level $DEBUG_LEVEL \
     --network $NETWORK \
     account validator import \
     --datadir "$DATADIR" \
     --directory "$LAUNCHPADDIR"