FROM node:latest

COPY . /app

WORKDIR /app

RUN npm install

ENV NODE_ENV=docker

EXPOSE 80

RUN npm build
# RUN ./node_modules/sequelize-cli/lib/sequelize db:migrate
CMD ["npm", "start"]