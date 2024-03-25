#!/bin/sh

id="$1"

podman stop $id

podman rm $id

podman image rm localhost/$id
