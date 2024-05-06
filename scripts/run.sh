#!/bin/bash

set -e

set -x

f="$1"

if [ ! -f "$f" ]; then
    echo "No such file: $1"
    exit 1
fi

id=$(echo $f | sed 's%.*cfg/%%;s/\.Containerfile//')

# If image doesn't exist, build it.
if ! podman image exists $id; then
    podman build \
	   -t $id \
	   -f cfg/$id.Containerfile
fi

# If container doesn't exist, create and run it.
if ! podman ps -a | grep -q $id; then
    # Maybe -security-opt seccomp=unconfined is needed?
    # Using --privileged for now.
    podman run \
	   --privileged \
	   --name $id \
	   -dt \
	   -v /data/$USER:/data/$USER \
	   $id
fi

# If container exists but isn't running, run it.
if ! podman ps | grep -q $id; then
    podman start $id    
fi

# Attach, but not using attach command to make sure exit doesn't stop the
# container.
podman exec -it $id bash
