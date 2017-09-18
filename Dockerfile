# HEPGEN.JS Docker

# ENV LOOP = number of loops
# ENV HEP_SERVER = address of HEP Server
# ENV HEP_PORT = port of HEP Server
# ENV HEP_CONFIG = hepgen configuration file

FROM alpine:latest

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh nodejs nodejs-npm

RUN cd /tmp && \
    git clone https://github.com/sipcapture/hepgen.js.git && \
    cd hepgen.js && \
    npm install

WORKDIR /tmp/hepgen.js   

CMD for i in `seq 1 ${LOOP:-1}`; do node hepgen.js -s "${HEP_SERVER:-127.0.0.1}" -p "${HEP_PORT:-9060}" -c "./config/${HEP_CONFIG:-b2bcall_rtcp.js}"; done
