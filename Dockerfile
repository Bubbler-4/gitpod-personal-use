FROM gitpod/workspace-full-vnc:latest

USER root
RUN rm /etc/apt/sources.list.d/ungoogled_chromium.list
RUN apt-get update -y -q \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends geary dbus-x11 firefox \
  fonts-noto-cjk fonts-noto-color-emoji ibus ibus-hangul
RUN sed -i "s/symbols\\[Group1\\] = \\[ Alt_R, Meta_R \\]/symbols[Group1] = [ Hangul ]/g" /usr/share/X11/xkb/symbols/altwin
# hangul input in docker: https://webcache.googleusercontent.com/search?q=cache:BetnWNgxu6AJ:https://www.clien.net/service/board/cm_linux/16623310+&cd=10&hl=en&ct=clnk&gl=jp

RUN cd /tmp \
  && curl -fsSL "https://discordapp.com/api/download?platform=linux&format=deb" -o discord.deb \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends ./discord.deb

RUN curl -sSL https://get.haskellstack.org/ | sh

USER gitpod
