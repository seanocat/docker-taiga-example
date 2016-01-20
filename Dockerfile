FROM seanocat/docker-taiga
MAINTAINER seanocat <seanocat@gmail.com>

# Install additional extensions
RUN pip install --no-cache-dir \
      taiga-contrib-slack \
      taiga-contrib-ldap-auth

ADD slack /usr/src/taiga-front-dist/dist/plugins/slack

COPY taiga-conf/local.py /taiga/local.py
COPY taiga-conf/conf.json /taiga/conf.json
