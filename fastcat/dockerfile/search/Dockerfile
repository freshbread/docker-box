FROM openjdk:8-jdk

ENV FASTCATSEARCH_HOME /usr/local/fastcatsearch3
ENV PATH $FASTCATSEARCH_HOME/bin:$PATH

RUN set -x \
	&& apt-get update

RUN apt-get install git -y
RUN apt-get install maven -y

# ARG GNCLOUD_REPOSITORY
ARG LIB
ARG FASTCATSEARCH_VERSION=3.24.0
ARG FASTCATSEARCH_REPO_URL=http://'freshbread':'freshbread1'@www.rosesystems.kr:8280/rosesystems/fastcatsearch3
#ARG ANALYZER_KOREAN_URL=http://www.rosesystems.kr:8280/rosesystems/analyzer-korean
#ARG ANALYZER_PRODUCT_URL=http://www.rosesystems.kr:8280/rosesystems/analyzer-product

RUN mkdir /projects/
WORKDIR /projects/

RUN git clone "$FASTCATSEARCH_REPO_URL"

WORKDIR /projects/fastcatsearch3

RUN mvn package
RUN mv /projects/fastcatsearch3/target/fastcatsearch-"$FASTCATSEARCH_VERSION"/ /usr/local/fastcatsearch3/

WORKDIR /usr/local/fastcatsearch3

# logback.conf의 loglevel을 info로 변경하고, 표준출력을 활성화 시킨다.
RUN sed -i 's/<!-- appender-ref ref="STDOUT" \/-->/<appender-ref ref="STDOUT" \/>/; s/root level="debug"/root level="info"/' conf/logback.xml

EXPOSE 8090
ENTRYPOINT ["/bin/bash", "bin/fastcatsearch"]
CMD ["run"]
