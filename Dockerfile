# HEPGEN.JS Docker
FROM alpine:latest

RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh nodejs nodejs-npm

RUN cd /tmp && \
    git clone https://github.com/sipcapture/hepgen.js.git && \
    cd hepgen.js && \
    npm install

WORKDIR /tmp/hepgen.js    
CMD node hepgen.js -s "${HEP_SERVER:-127.0.0.1}" -p "${HEP_PORT:-9060}" -c "./config/${HEP_CONFIG:-b2bcall_rtcp.js}"
