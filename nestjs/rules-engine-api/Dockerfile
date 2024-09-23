FROM node:20.16.0
WORKDIR /usr/src/app

# Install dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Copy source files
COPY . .

EXPOSE 3000

# Start the application using Nest CLI in watch mode
# TODO: should probably not use a dev server for prod
CMD ["yarn", "start:dev"]
