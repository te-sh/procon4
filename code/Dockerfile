FROM debian:bookworm-slim

RUN apt-get update \
 && apt-get install -y \
  curl \
  git \
  build-essential \
  libbsd-dev \
  libevent-dev \
  libgmp-dev \
  libgmpxx4ldbl \
  libpcre2-dev \
  libssl-dev \
  libtool \
  libxml2-dev \
  libyaml-dev \
  lld \
  llvm \
  llvm-dev \
  libz-dev

WORKDIR /root
ENV ASDF_DIR=/root/.asdf

COPY script/install.sh ./

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0 \
 && echo '. "$HOME/.asdf/asdf.sh"' >> .bashrc \
 && ./install.sh
