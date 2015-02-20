# orientdb
#
# VERSION: see `TAG`
FROM joaodubas/openjdk:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# install system deps
RUN apt-get -y -qq update \
    && apt-get -y -qq install curl

# install orientdb
ENV ROOT /opt/downloads
ENV ORIENT_VERSION orientdb-community-2.0.2
ENV ORIENT_URL http://www.orientechnologies.com/download.php?email=unknown@unknown.com&file=${ORIENT_VERSION}.tar.gz&os=linux
RUN mkdir ${ROOT} \
    && cd ${ROOT} \
    && curl ${ORIENT_URL} > ${ORIENT_VERSION}.tar.gz \
    && tar -xzf ${ORIENT_VERSION}.tar.gz \
    && ln -s ${ROOT}/${ORIENT_VERSION} ${ROOT}/orientdb \
    && ln -s ${ROOT}/orientdb/bin/* /usr/local/bin/ \
    && mkdir /usr/local/log

# cleanup
RUN apt-get -y -qq --force-yes clean \
    && rm -rf /opt/downloads/linux /var/lib/apt/lists/* /tmp/* /var/tmp/*

# configure system
EXPOSE 2424
EXPOSE 2480
CMD ["/usr/local/bin/server.sh"]
