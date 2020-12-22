#!/bin/sh
docker build -t go-simple-app:0.0.1 .
docker run --rm \
  -e ENV_MSG=hello \
  -p 8080:8080 -it go-simple-app:0.0.1 /bin/bash
