#locator dockerfile

#FROM python:3.8-slim-bullseye
FROM python:3.8-slim-buster

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