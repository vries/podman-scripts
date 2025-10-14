FROM registry.opensuse.org/opensuse/leap:16.0

RUN zypper -n install \
    unknown version for opensuse

RUN zypper clean
