# orientdb
#
# VERSION: see `TAG`
FROM joaodubas/openjdk:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# install system deps
RUN apt-get -y -qq update \
    && apt-get -y -qq install wget

# install orientdb
ENV ORIENT_URL http://www.orientdb.org/portal/function/portal/download/unknown@unknown.com
ENV ORIENT_VERSION orientdb-community-1.7.4
RUN mkdir /opt/downloads \
    && cd /opt/downloads \
    && wget $ORIENT_URL/-/-/-/-/-/$ORIENT_VERSION.tar.gz/false/false/linux \
    && tar -xzf linux \
    && cd $ORIENT_VERSION \
    && ln -s /opt/downloads/$ORIENT_VERSION/bin/* /usr/local/bin/

# clenaup
RUN apt-get -y -qq --force-yes clean \
    && rm -rf /opt/downloads/linux /var/lib/apt/lists/* /tmp/* /var/tmp/*

# configure system
EXPOSE 2424
EXPOSE 2480
CMD ["/usr/local/bin/server.sh"]
