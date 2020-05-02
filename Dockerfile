FROM node:latest

ARG HOST_USER="dev"
ARG HOST_UID="1000"
ARG HOST_GID="100"

RUN userdel -r node

RUN groupadd -r $HOST_USER \
    && useradd -d /home/$HOST_USER -g $HOST_GID -m -r -u $HOST_UID $HOST_USER \
    && mkdir /home/$HOST_USER/website/ \
    && chown $HOST_USER:$HOST_GID /home/$HOST_USER/website/



WORKDIR /home/$HOST_USER/website

COPY --chown=$HOST_USER ./website ./website

run npm install \ 
    && npm install -g gulp-cli

USER $HOST_USER

CMD npm start

#RUN npm init -y && npm install \
#        jquery \
#        popper.js \
#        bootstrap