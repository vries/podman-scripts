#!/bin/sh

podman stop --all

podman rm --all

podman image rm -f --all

podman system df
