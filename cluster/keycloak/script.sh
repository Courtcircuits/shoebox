#!/bin/bash

kubectl create secret generic keycloak-db-secret \
  --from-literal=username=testuser \
  --from-literal=password=testpassword \
  -n keycloak
