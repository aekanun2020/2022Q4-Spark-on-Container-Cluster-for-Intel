ARG debian_buster_image_tag=8-jre-slim
FROM openjdk:${debian_buster_image_tag}
LABEL manteiner="aekanunbigdata@gmail.com>"

# -- Layer: Image Metadata

ARG build_date

LABEL org.label-schema.build-date=${build_date}
LABEL org.label-schema.name="Apache Spark Multi-nodes Standalone Cluster on Docker - Cluster Base Image"
LABEL org.label-schema.description="Cluster base image shipped with Python and a shared workspace folder"
LABEL org.label-schema.url="http://www.aekanun.com"
LABEL org.label-schema.schema-version="1.0"

# -- Layer: OS + Python + Scala

ARG scala_version
ARG shared_workspace=/opt/workspace



RUN mkdir -p ${shared_workspace} && \
    apt-get update -y && \
    apt-get install -y python3 && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*

#RUN mkdir -p ${shared_workspace}/data && \
#    mkdir -p /usr/share/man/man1 && \
#    apt-get update -y && \
#    apt-get install -y curl python3 r-base && \
#    ln -s /usr/bin/python3 /usr/bin/python && \
#    curl https://downloads.lightbend.com/scala/${scala_version}/scala-${scala_version}.deb -k -o scala.deb && \
#    apt install -y ./scala.deb && \
#    rm -rf scala.deb /var/lib/apt/lists/*

#ENV SCALA_HOME="/usr/bin/scala"
#ENV PATH=${PATH}:${SCALA_HOME}/bin
ENV SHARED_WORKSPACE=${shared_workspace}

# -- Runtime

VOLUME ${shared_workspace}
CMD ["bash"]
