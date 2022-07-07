FROM gitpod/workspace-full-vnc:latest

USER root
RUN curl -sSL https://download.opensuse.org/repositories/home:/ungoogled_chromium/Ubuntu_Focal/Release.key | apt-key add - \
  && apt-get update -y -q \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends geary dbus-x11 firefox

RUN cd /tmp \
  && curl -fsSL https://discordapp.com/api/download?platform=linux&format=deb -o discord.deb \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends ./discord.deb \

RUN curl -sSL https://get.haskellstack.org/ | sh

USER gitpod
