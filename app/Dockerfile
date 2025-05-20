FROM node:latest

RUN apt-get update && apt-get install -y tini

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

WORKDIR /usr/src/app

ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["/docker-entrypoint.sh"]
