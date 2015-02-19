#!/bin/bash

set -x -e

ENVIRONMENT_URL="$WERCKER_CD_GATE_ENDPOINT/$WERCKER_CD_GATE_ENVIRONMENT"
SERVICE_URL="$ENVIRONMENT_URL/$WERCKER_CD_GATE_SERVICE"

ENVIRONMENT_FLAG="$(curl $ENVIRONMENT_URL 2>/dev/null)"
SERVICE_FLAG="$(curl $SERVICE_URL 2>/dev/null)"

if [ $ENVIRONMENT_FLAG == "off" ]; then
  echo "Deployments to $WERCKER_CD_GATE_ENVIRONMENT are off";
  exit 1
fi
if [ $SERVICE_FLAG == "off" ]; then
  echo "Deployments of $WERCKER_CD_GATE_SERVICE are off";
  exit 1
fi
