FROM registry.fedoraproject.org/fedora:42

RUN dnf upgrade -y

RUN dnf install --skip-unavailable -y \
    unknown version for fedora

RUN dnf clean all
