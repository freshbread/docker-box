cd /home/rose/docker-compose/fastcat
docker-compose down
cd /home/rose/fastcat/console
rm ./*.bak
mv /home/rose/fastcat/console/fastcatsearch-console.war /home/rose/fastcat/console/fastcatsearch-console.war.bak
docker cp gitlab-runner:/home/gitlab-runner/.m2/repository/co/fastcat/fastcatsearch-console/3.2.1/fastcatsearch-console-3.2.1.war /home/rose/fastcat/console/fastcatsearch-console.war
chown -R rose:rose ./*
cd /home/rose/docker-compose/fastcat
docker-compose up -d
