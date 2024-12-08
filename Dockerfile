FROM docker:27.3.1

RUN apk update
RUN apk upgrade
RUN apk add python3 python3-dev py-pip build-base libffi-dev openssl-dev libgcc rustup
RUN pip install --upgrade pip
RUN pip install docker-compose
