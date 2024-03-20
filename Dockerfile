FROM gitpod/workspace-full-vnc:latest

USER root
RUN apt-get update -y -q \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends geary dbus-x11 firefox \
  fonts-noto-cjk fonts-noto-color-emoji

RUN cd /tmp \
  && curl -fsSL "https://discordapp.com/api/download?platform=linux&format=deb" -o discord.deb \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends ./discord.deb \
  && curl -fsSL "https://github.com/Riey/kime/releases/download/v3.0.2/kime_ubuntu-22.04_v3.0.2_amd64.deb" -o kime.deb \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends ./kime.deb

RUN curl -sSL https://get.haskellstack.org/ | sh

RUN cd /tmp \
    && curl -fsSL https://github.com/typst/typst/releases/download/v0.9.0/typst-x86_64-unknown-linux-musl.tar.xz -o typst.tar.xz \
    && tar xf typst.tar.xz \
    && cd typst-x86_64-unknown-linux-musl \
    && cp typst /usr/local/bin/typst

USER gitpod
RUN printf "export GTK_IM_MODULE=kime\nexport QT_IM_MODULE=kime\nexport XMODIFIERS=@im=kime" > /home/gitpod/.xprofile