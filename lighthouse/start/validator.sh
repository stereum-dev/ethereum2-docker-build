#!/bin/bash

/opt/app/lighthouse \
     --debug-level $DEBUG_LEVEL \
     --network $NETWORK \
     validator \
     --beacon-nodes http://beacon:5052 \
     --datadir "$DATADIR" \
     --init-slashing-protection \
     --graffiti "$GRAFFITI"