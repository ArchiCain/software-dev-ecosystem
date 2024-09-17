FROM node:20.16.0
WORKDIR /usr/src/app
COPY package.json ./
RUN yarn install
COPY . .
RUN yarn build
EXPOSE 80
# Disable Angular CLI analytics prompt
ENV NG_CLI_ANALYTICS=false
CMD [ "npx", "http-server", "dist/rules-engine-ui/browser", "-p", "80" ]
