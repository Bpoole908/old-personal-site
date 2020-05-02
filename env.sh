#!/bin/bash

alias web-make="docker run \
--rm \
-it \
-v $(pwd)/website:/home/dev/website \
-p 3000:3000 \
-p 3001:3001 \
--name bs4-website \
website:latest"

alias web-attach="docker run \
--rm \
-dit \
-v $(pwd)/website:/home/dev/website \
-p 3000:3000 \
-p 3001:3001 \
--name bs4-website \
website:latest \
bash \
&& docker attach bs4-website"

alias pel-stop="docker stop pelican"