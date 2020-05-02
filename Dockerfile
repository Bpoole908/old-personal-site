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

run npm update \ 
    && npm install -g gulp-cli

USER $HOST_USER

RUN echo 'export PS1="🐳 \[\033[1;36m\]\u@\[\033[1;32m\]\h:\[\033[1;34m\]\w\[\033[0m\]\$ "' >> $HOME/.bashrc

CMD npm start

#RUN npm init -y && npm install \
#        jquery \
#        popper.js \
#        bootstrap