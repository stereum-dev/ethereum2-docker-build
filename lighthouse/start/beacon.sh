#!/bin/bash

/opt/app/lighthouse \
  --debug-level $DEBUG_LEVEL \
  --network $NETWORK \
  beacon \
  --eth1-endpoints http://geth:8545 \
  --http \
  --http-address 0.0.0.0 \
  --metrics \
  --metrics-address 0.0.0.0 \
  --disable-upnp