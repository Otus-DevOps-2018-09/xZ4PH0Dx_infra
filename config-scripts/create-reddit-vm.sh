#!/bin/bash
gcloud compute instances create reddit-app \
    --image-family reddit-full \
    --image-project=infra-207221 \
    --machine-type=g1-small \
    --tags puma-server \
    --network-interface network=default,subnet=default \
    --restart-on-failure

