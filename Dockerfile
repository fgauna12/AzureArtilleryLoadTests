FROM node:8-alpine

WORKDIR /app

COPY ./package.json /app
COPY ./artifacts/ /app/artifacts

# # Install bash because alphine docker image doesn't come with it
# RUN apk add --no-cache bash

RUN ["npm", "install"]

# Build time argument
ARG ARTILLERY_ENVIRONMENT=dev
ARG RESULTS_FILE_SHARE=.
ARG REPORT_FILENAME=report.json
ARG ARTILLERYIO_FILE=./artifacts/load.yml 

# Run time argument, default to the build time argument
ENV ARTILLERY_ENVIRONMENT=$ARTILLERY_ENVIRONMENT
ENV RESULTS_FILE_SHARE=$RESULTS_FILE_SHARE
ENV REPORT_FILENAME=$REPORT_FILENAME
ENV ARTILLERYIO_FILE=$ARTILLERYIO_FILE

ENTRYPOINT [ "run-load-test.sh" ]
