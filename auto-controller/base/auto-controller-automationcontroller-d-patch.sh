#!/usr/bin/env bash

oc get deployment/controller-dev
while [ $? -ne 0 ]; do
  sleep 2
  oc get deployment/controller-dev
done

oc patch deployment/controller-dev -p '{"spec":{"template":{"spec":{"containers":[{"name":"redis","resources":{"limits":{"cpu":"0","memory":"0"},"requests":{"cpu":"0","memory":"0"}}}]}}}}'
