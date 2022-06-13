FROM ghcr.io/moviepediafilms/backend:latest

RUN apt-get update && apt-get -y install cron

COPY crontab /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab
RUN /usr/bin/crontab /etc/cron.d/crontab
RUN touch /var/log/cron.log

COPY start.sh /app/start.sh

ENTRYPOINT ["/app/start.sh"]