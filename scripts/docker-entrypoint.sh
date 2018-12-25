#!/usr/bin/env bash

./scripts/wait-for-it.sh db:3306 -t 30

./node_modules/sequelize-cli/lib/sequelize db:migrate
./node_modules/sequelize-cli/lib/sequelize db:seed:all
npm run develop