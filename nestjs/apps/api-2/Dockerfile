# Use Node.js 20.16.0 as the base image
FROM node:20.16.0

# Set the working directory to the root of the monorepo
WORKDIR /usr/src/app

# Copy the monorepo contents except defined in .dockerignore
COPY . .

# Install dependencies from the root package.json
RUN yarn install

# Set the working directory to the specific NestJS project
WORKDIR /usr/src/app/nestjs/apps/api-2

# Expose the port the app runs on
EXPOSE 3000

# Start the application using Nest CLI in watch mode
CMD ["yarn", "start:dev", "api-2"]
