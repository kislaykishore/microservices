#!/bin/bash
for i in {1..1000}; do curl -w "\n" "http://${GATEWAY_URL}" ; sleep 1; done
