FROM devopstf/devops-docker-jdk

RUN \
    mkdir /opt/nexus3 && \
    cd /opt/nexus3

COPY nexus-3.6.0-02-unix.tar.gz /opt/nexus3/nexus-3.6.0-02-unix.tar.gz

RUN \
    cd /opt/nexus3 && \
    tar -xvf nexus-3.6.0-02-unix.tar.gz


ENV INSTALL4J_JAVA_HOME=/opt/jdk1.8.0_73/jre/

RUN \
    groupadd -g 65534 nfsnobody && \
    useradd -u 65534 -g 65534 nfsnobody && \
    chown -R nfsnobody:nfsnobody /opt/nexus3

USER nfsnobody
##

CMD ["/opt/nexus3/nexus-3.6.0-02/bin/nexus", "run"]
