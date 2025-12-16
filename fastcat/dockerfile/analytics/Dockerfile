FROM openjdk:8-jdk

ENV ANALYTICS_HOME /usr/local/fastcat-analytics/bin
ENV PATH $ANALYTICS_HOME:$PATH

RUN set -x \
        && apt-get update

RUN apt-get install git -y
RUN apt-get install maven -y

ARG LIB
ARG ANALYTICS_VERSION=1.17.4
ARG ANALYTICS_REPO_URL=http://'freshbread':'saya2485$'@www.rosesystems.kr:8280/rosesystems/analytics

RUN mkdir /projects/
WORKDIR /projects/

RUN git clone "$ANALYTICS_REPO_URL"

WORKDIR /projects/analytics

RUN mvn package
RUN ls /projects/analytics/target/
RUN mv /projects/analytics/target/analytics-"$ANALYTICS_VERSION"/ /usr/local/fastcat-analytics/

WORKDIR /usr/local/fastcat-analytics/bin

EXPOSE 8081
ENTRYPOINT ["/bin/bash", "analytics.sh"]
CMD ["run"]
