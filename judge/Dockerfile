FROM python:3.12.2-slim-bookworm

RUN apt-get update \
 && apt-get install -y curl pypy3 docker.io sudo time \
 && groupadd -g 1000 appgroup \
 && useradd -m -s /bin/bash -u 1000 -g 1000 -G sudo,root appuser \
 && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ENV APPDIR /judge
RUN mkdir -p $APPDIR \
 && chown appuser:appgroup $APPDIR

WORKDIR $APPDIR

USER appuser
ENV PATH $PATH:/home/appuser/.local/bin

RUN pip install --upgrade pip \
 && pip install online-judge-tools termcolor watchdog
