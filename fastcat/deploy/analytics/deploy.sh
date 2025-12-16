cd /home/rose/docker-compose/fastcat
docker-compose down
cd /home/rose/fastcat/analytics/lib
rm ./*.bak
mv /home/rose/fastcat/analytics/lib/analytics-server-1.17.4.jar /home/rose/fastcat/analytics/lib/analytics-server-1.17.4.jar.bak
docker cp gitlab-runner:/home/gitlab-runner/.m2/repository/co/fastcat/analytics/analytics-server/1.17.4/analytics-server-1.17.4.jar /home/rose/fastcat/analytics/lib/analytics-server-1.17.4.jar
chown -R rose:rose ./*
cd /home/rose/fastcat/analytics/web
rm ./*.bak
mv /home/rose/fastcat/analytics/web/analytics-web.war /home/rose/fastcat/analytics/web/analytics-web.war.bak
docker cp gitlab-runner:/home/gitlab-runner/.m2/repository/co/fastcat/analytics/analytics-web/1.17.4/analytics-web-1.17.4.war /home/rose/fastcat/analytics/web/analytics-web.war
chown -R rose:rose ./*
cd /home/rose/docker-compose/fastcat
docker-compose up -d
