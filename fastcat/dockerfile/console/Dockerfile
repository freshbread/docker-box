FROM openjdk:8-jdk

ENV FASTCATSEARCH_CONSOLE_HOME /usr/local/fastcatsearch-console
ENV PATH $FASTCATSEARCH_CONSOLE_HOME:$PATH

RUN set -x \
	&& apt-get update

RUN apt-get install git -y
RUN apt-get install maven -y

ARG FASTCATSEARCH_CONSOLE_VERSION=3.2.1
ARG FASTCATSEARCH_CONSOLE_REPO_URL=http://'freshbread':'freshbread1'@www.rosesystems.kr:8280/rosesystems/fastcatsearch-console

RUN mkdir /projects/
WORKDIR /projects/

RUN git clone "$FASTCATSEARCH_CONSOLE_REPO_URL"

WORKDIR /projects/fastcatsearch-console
RUN mvn package
RUN mv /projects/fastcatsearch-console/target/fastcatsearch-console-"$FASTCATSEARCH_CONSOLE_VERSION"/ /usr/local/fastcatsearch-console/

WORKDIR "$FASTCATSEARCH_CONSOLE_HOME"

EXPOSE 8080
ENTRYPOINT ["/bin/bash", "run-console.sh"]
