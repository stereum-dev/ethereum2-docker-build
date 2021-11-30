#!/bin/bash

set -o xtrace
set -o verbose

account_validator_import="account validator import" 

/opt/app/lighthouse \
     --debug-level "$DEBUG_LEVEL" \
     --network "$NETWORK" \
     echo $account_validator_import \
     --datadir "$DATADIR" \
     --directory "$LAUNCHPADDIR"
