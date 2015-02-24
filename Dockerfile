# orientdb
#
# VERSION: see `TAG`
FROM joaodubas/openjdk:latest
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# install orientdb
ENV ORIENTDB_VERSION orientdb-community-2.0.3
ENV ORIENTDB_URL http://www.orientechnologies.com/download.php?email=unknown@unknown.com&file=${ORIENTDB_VERSION}.tar.gz&os=linux
ENV ORIENTDB_ROOT_PASSWORD 0r13ntDB
ADD ${ORIENTDB_URL} /usr/local/src/orientdb-community.tar.gz
RUN cd /usr/local/src \
    && mkdir /usr/local/log \
    && mkdir ${PWD}/orientdb \
    && tar -xzf orientdb-community.tar.gz -C ${PWD}/orientdb \
    && ln -s ${PWD}/orientdb/bin/* /usr/local/bin/ \
    && rm ${PWD}/orientdb-community.tar.gz

# configure system
EXPOSE 2424
EXPOSE 2480
CMD ["/usr/local/bin/server.sh"]
