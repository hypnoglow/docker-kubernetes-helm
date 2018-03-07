#!/usr/bin/env sh

helm repo update > /dev/null
exec $@
