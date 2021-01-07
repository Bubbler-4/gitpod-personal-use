FROM gitpod/workspace-full-vnc:latest

USER root
RUN apt-get update -y -q \
  && apt-get install -y -q --no-install-recommends geary dbus-x11 firefox

USER gitpod
