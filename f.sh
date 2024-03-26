#!/bin/sh

usage()
{
    echo "usage: $0 <fedora version>"
}

if [ $# -ne 1 ]; then
    usage
    exit 1
fi

f=cfg/fedora-"$1"-gdb.Containerfile

if [ ! -f $f ]; then
    echo "Available versions:"
    ls cfg/fedora-*-gdb.Containerfile
    exit 1
fi

./scripts/run.sh $f
