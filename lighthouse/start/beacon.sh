#!/bin/bash

/opt/app/lighthouse \
  --debug-level $DEBUG_LEVEL \
  --network $NETWORK \
  beacon \
  --eth1-endpoints "$ETH1_NODE" \
  --datadir "$DATADIR" \
  --http \
  --http-address 0.0.0.0 \
  --metrics \
  --metrics-address 0.0.0.0 \
  --disable-upnp