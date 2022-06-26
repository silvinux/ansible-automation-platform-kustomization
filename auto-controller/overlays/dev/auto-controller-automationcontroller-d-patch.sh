#!/usr/bin/env bash

oc get deployment/controller-poc
while [ $? -ne 0 ]; do
  sleep 2
  oc get deployment/controller-poc
done

oc patch deployment/controller-poc -p '{"spec":{"template":{"spec":{"containers":[{"name":"redis","resources":{"limits":{"cpu":"0","memory":"0"},"requests":{"cpu":"0","memory":"0"}}}]}}}}'
