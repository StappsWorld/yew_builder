FROM rust:latest AS frontend-builder

RUN update-ca-certificates

RUN apt update

RUN apt install -y npm

RUN curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-linux-x64 
RUN chmod +x tailwindcss-linux-x64
RUN mv tailwindcss-linux-x64 /usr/local/bin/tailwindcss

RUN wget -qO- https://github.com/thedodd/trunk/releases/download/v0.20.2/trunk-x86_64-unknown-linux-gnu.tar.gz | tar xvz
RUN chmod +x trunk
RUN mv trunk /usr/local/bin/trunk

RUN rustup target add wasm32-unknown-unknown

