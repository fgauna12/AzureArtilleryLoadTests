# FROM node:8-alpine
FROM mcr.microsoft.com/powershell:6.2.1-alpine-3.8

WORKDIR /app

RUN apk add --update nodejs nodejs-npm
SHELL [ "pwsh", "--Command" ]

COPY ./package.json /app

# Restore the NPM packages
RUN ["npm", "install"]

COPY ./artifacts/ .
COPY ./run-load-test.ps1 .

# Build time argument
ARG ARTILLERY_ENVIRONMENT=dev
ARG RESULTS_FILE_SHARE=.
ARG REPORT_FILENAME=report.json
ARG ARTILLERYIO_FILE=./load.yml 

# Run time argument, default to the build time argument
ENV ARTILLERY_ENVIRONMENT=$ARTILLERY_ENVIRONMENT
ENV RESULTS_FILE_SHARE=$RESULTS_FILE_SHARE
ENV REPORT_FILENAME=$REPORT_FILENAME
ENV ARTILLERYIO_FILE=$ARTILLERYIO_FILE

ENTRYPOINT [ "pwsh", "run-load-test.ps1" ]
