#!/bin/bash

/opt/app/lighthouse \
  --debug-level "$DEBUG_LEVEL" \
  --network "$NETWORK" \
  beacon \
  --eth1-endpoints "$ETH1_NODES" \
  --eth1-blocks-per-log-query "150" \
  --datadir "$DATADIR" \
  --http \
  --http-address 0.0.0.0 \
  --metrics \
  --metrics-address 0.0.0.0 \
  --disable-upnp \
  --validator-monitor-auto \
  --slasher \
  --slasher-dir "$SLASHERDIR" \
  --slasher-max-db-size "$SLASHER_DB_SIZE"
