# docker-hepgen

Throwaway HEPGEN.JS Docker container to feature test HOMER & HEPIC

#### 1 B2BUA SIP Session w/ RTCP + Logs
```
docker run -ti --rm --name hepgen -e HEP_SERVER="10.0.0.1" -e HEP_PORT=9060 qxip/docker-hepgen
```

#### 100 Scanners
```
docker run -ti --rm -e HEP_SERVER="10.0.0.1" -e LOOP=100 -e HEP_CONFIG="scanner.js" qxip/docker-hepgen
```

