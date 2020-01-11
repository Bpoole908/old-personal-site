FROM node:latest

ARG HOST_USER="dev"
ARG HOST_USER_UID="1000"
ARG HOST_USER_GID="100"

RUN userdel -r node
RUN set -ex  \
    && useradd -lm -u $HOST_USER_UID -g $HOST_USER_GID $HOST_USER

COPY ./site ./site

ENV WORKING_DIR=/home/$HOST_USER/site

WORKDIR $WORKING_DIR

run npm install \ 
    && npm install -g gulp-cli
USER $HOST_USER

CMD npm start

#RUN npm init -y && npm install \
#        jquery \
#        popper.js \
#        bootstrap