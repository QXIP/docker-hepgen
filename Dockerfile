# HEPGEN.JS Docker

# ENV LOOP = number of loops
# ENV SLEEP = seconds to sleep on exit
# ENV HEP_SERVER = address of HEP Server
# ENV HEP_PORT = port of HEP Server
# ENV HEP_CONFIG = hepgen configuration file

FROM node:16-alpine
RUN apk add git

WORKDIR /
RUN git clone https://github.com/sipcapture/hepgen.js.git && \
    cd hepgen.js && \
    npm install

WORKDIR /hepgen.js   

CMD for i in `seq 1 ${LOOP:-1}`; do node hepgen.js -s "${HEP_SERVER:-127.0.0.1}" -p "${HEP_PORT:-9060}" -c "./config/${HEP_CONFIG:-b2bcall_rtcp.js}"; done; sleep ${SLEEP:-1}
