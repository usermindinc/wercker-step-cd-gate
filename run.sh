#!/bin/bash

set -e

# Alias environment
case "$WERCKER_CD_GATE_ENVIRONMENT" in
  "p" | "prod" | "prodsky")
    WERCKER_CD_GATE_ENVIRONMENT=production
    ;;
  "s" | "stag" | "stage" | "boom")
    WERCKER_CD_GATE_ENVIRONMENT=staging
    ;;
esac

set -x
ENVIRONMENT_FLAG_URL="$WERCKER_CD_GATE_ENDPOINT/$WERCKER_CD_GATE_ENVIRONMENT"
APPLICATION_FLAG_URL="$ENVIRONMENT_FLAG_URL/$WERCKER_CD_GATE_APPLICATION"
set +x

ENVIRONMENT_FLAG="$(curl $ENVIRONMENT_FLAG_URL 2>/dev/null)"
APPLICATION_FLAG="$(curl $APPLICATION_FLAG_URL 2>/dev/null)"

if [ "$ENVIRONMENT_FLAG" != "on" ]; then
  echo "Deployments to $WERCKER_CD_GATE_ENVIRONMENT are off";
  exit 1
elif [ "$APPLICATION_FLAG" != "on" ]; then
  echo "Deployments to $WERCKER_CD_GATE_ENVIRONMENT/$WERCKER_CD_GATE_APPLICATION are off";
  exit 1
else
  echo "Deployments to $WERCKER_CD_GATE_ENVIRONMENT/$WERCKER_CD_GATE_APPLICATION are on";
fi
