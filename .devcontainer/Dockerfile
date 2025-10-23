FROM mcr.microsoft.com/devcontainers/base:debian

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y \
        libsecret-1-0 \
        libsecret-1-dev \
        gnome-keyring \
    && rm -rf /var/lib/apt/lists/*
