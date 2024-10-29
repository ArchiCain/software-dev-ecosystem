# Stage 1: Build the NestJS application
FROM node:20.16.0 as builder

WORKDIR /app

# Copy package.json and yarn.lock
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

COPY . .

# Build the NestJS application
RUN yarn nx build api-1 --prod

# Stage 2: Serve the application with Node.js
FROM node:20.16.0-alpine

WORKDIR /app

# Copy package.json and yarn.lock
COPY package.json yarn.lock ./

# Install production dependencies only
RUN yarn install --production --frozen-lockfile

# Copy the build output from the builder stage
COPY --from=builder /app/dist/apps/nestjs/api-1 ./dist

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["node", "dist/main"]
