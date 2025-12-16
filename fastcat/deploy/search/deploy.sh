cd /home/rose/docker-compose/fastcat
docker-compose down
cd /home/rose/fastcat/search/lib
#rm fastcatsearch-*.jar
#docker cp gitlab-runner:/home/gitlab-runner/.m2/repository/org/fastcatsearch/uengine.sns-0.0.1-SNAPSHOT.war /home/rose/docker-compose/sns/webapps/sns.war
rm ./*.bak
mv /home/rose/fastcat/search/lib/fastcatsearch-core-3.24.0.jar /home/rose/fastcat/search/lib/fastcatsearch-core-3.24.0.jar.bak
mv /home/rose/fastcat/search/lib/fastcatsearch-server-3.24.0.jar /home/rose/fastcat/search/lib/fastcatsearch-server-3.24.0.jar.bak
docker cp gitlab-runner:/home/gitlab-runner/.m2/repository/co/fastcat/fastcatsearch/fastcatsearch-core/3.24.0/fastcatsearch-core-3.24.0.jar /home/rose/fastcat/search/lib/
docker cp gitlab-runner:/home/gitlab-runner/.m2/repository/co/fastcat/fastcatsearch/fastcatsearch-server/3.24.0/fastcatsearch-server-3.24.0.jar /home/rose/fastcat/search/lib/
chown -R rose:rose ./*
cd /home/rose/docker-compose/fastcat
docker-compose up -d
