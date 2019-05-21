#!/bin/bash
for i in {1..10000}; do curl -w "\n" -m 2 "http://${GATEWAY_URL}" ; sleep 1; done
