FROM node:20.16.0
WORKDIR /usr/src/app
COPY package.json ./
RUN yarn install
COPY . .
RUN yarn build web-app-2
EXPOSE 80
# Disable Angular CLI analytics prompt
ENV NG_CLI_ANALYTICS=false
# TODO: should we use this http-server for prod?
CMD [ "npx", "http-server", "dist/web-app-2/browser", "-p", "80" ]
