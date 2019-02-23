FROM node:latest

COPY . /app

WORKDIR /app

RUN npm install

ENV NODE_ENV=docker

RUN npm build

RUN ["chmod", "+x", "/app/scripts/docker-entrypoint.sh"]

ENTRYPOINT ["./scripts/docker-entrypoint.sh"]