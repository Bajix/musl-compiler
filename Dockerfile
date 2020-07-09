FROM bajix/node-alpine:14.4.0-alpine3.12

RUN apk add --no-cache --virtual .build-deps musl curl python3 py3-pip;

RUN pip3 install awscli;

RUN curl https://sh.rustup.rs -sSf | sh -s -- --profile minimal --default-toolchain stable -y

ENV PATH=/root/.cargo/bin:$PATH

RUN rustup target add x86_64-unknown-linux-musl

CMD ["/bin/bash"]
