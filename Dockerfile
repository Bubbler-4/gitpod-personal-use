FROM gitpod/workspace-full-vnc:latest

USER root
RUN apt-get update -y -q \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends geary dbus-x11 firefox \
  fonts-noto-cjk fonts-noto-color-emoji

RUN cd /tmp \
  && curl -fsSL "https://discordapp.com/api/download?platform=linux&format=deb" -o discord.deb \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends ./discord.deb

RUN curl -sSL https://get.haskellstack.org/ | sh

RUN cd /tmp \
    && curl -fsSL https://github.com/typst/typst/releases/download/v0.9.0/typst-x86_64-unknown-linux-musl.tar.xz -o typst.tar.xz \
    && tar xf typst.tar.xz \
    && cd typst-x86_64-unknown-linux-musl \
    && cp typst /usr/local/bin/typst

USER gitpod
