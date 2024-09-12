FROM node:20.16.0
WORKDIR /usr/src/app
COPY package.json ./
RUN yarn install
COPY . .
RUN yarn build
EXPOSE 80
CMD [ "npx", "http-server", "dist/rules-engine-ui", "-p", "80" ]
