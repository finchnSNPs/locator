#locator dockerfile

#arm64
#FROM python:3.8-slim-bullseye
#amd64
#FROM python:3.8-slim-buster

#required for cross platform build - linux/amd64 and linux/arm64
FROM --platform=$BUILDPLATFORM python:3.8-slim-buster AS build

RUN su -
RUN apt update
RUN apt install sudo -y

RUN apt-get update && \
    apt-get install -y --no-install-recommends gcc build-essential
RUN exit

RUN sudo apt install git -y

RUN apt-get install nano -y

RUN git clone https://github.com/finchnSNPs/locator.git

WORKDIR locator

RUN pip install -r req.txt

RUN chmod -R 777 *

CMD ["/bin/bash"]
