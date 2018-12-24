FROM resin/rpi-raspbian:stretch
MAINTAINER kevinosorus <kevin.caradant@gmail.com>
RUN docker run --rm --privileged multiarch/qemu-user-static:register --reset
RUN apt-get clean && apt-get update && apt-get install -y --no-install-recommends xserver-xorg xinit \
     fbset libraspberrypi0 alsa-base alsa-utils alsa-tools kodi xserver-xorg-legacy dbus-x11 \
     && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN usermod -a -G audio root && \
usermod -a -G video root && \
usermod -a -G input root && \
usermod -a -G dialout root && \
usermod -a -G plugdev root && \
usermod -a -G tty root

CMD ["bash", "/usr/bin/kodi"]
