FROM alpine:3.18

RUN apk add bash curl git

WORKDIR /root
ENV ASDF_DIR=/root/.asdf

COPY install.sh ./

RUN git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0 \
 && echo '. "$HOME/.asdf/asdf.sh"' >> .bashrc \
 && ./install.sh
