#!/bin/bash

set -o xtrace
set -o verbose

opt_app_lighthouse="/opt/app/lighthouse"
account_validator_import="account validator import" 

echo $opt_app_lighthouse \
     --debug-level "$DEBUG_LEVEL" \
     --network "$NETWORK" \
     echo $account_validator_import | bash \
     --datadir "$DATADIR" \
     --directory "$LAUNCHPADDIR"
