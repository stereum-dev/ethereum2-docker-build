#!/bin/bash

/opt/app/lighthouse \
     --debug-level "$DEBUG_LEVEL" \
     --network "$NETWORK" \
     validator \
     --beacon-nodes "$BEACON_NODES" \
     --datadir "$DATADIR" \
     --init-slashing-protection \
     --graffiti "$GRAFFITI" \
     --metrics \
     --metrics-address 0.0.0.0
