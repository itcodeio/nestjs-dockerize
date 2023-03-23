FROM node:lts-alpine

WORKDIR /app

ADD package.json package.json

RUN yarn install

ADD . .

ADD .env .env

RUN yarn build

EXPOSE 3100

CMD ["node", "./dist/main.js"]
