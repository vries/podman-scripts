FROM registry.opensuse.org/opensuse/leap:15.6

RUN zypper -n install \
    unknown version for opensuse

RUN zypper clean
