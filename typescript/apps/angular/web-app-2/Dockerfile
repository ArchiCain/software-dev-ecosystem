# Stage 1: Build the Angular application
FROM node:20.16.0 as builder

WORKDIR /app

# Copy package.json and yarn.lock
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

COPY . .

# Build the Angular application
RUN yarn nx build web-app-2 --prod

# Stage 2: Serve the application with Nginx
FROM nginx:alpine

# Remove the default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy the build output to replace the default nginx contents
COPY --from=builder /app/dist/apps/angular/web-app-2/browser /usr/share/nginx/html

# Copy custom nginx config
COPY ./apps/angular/nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Run nginx
CMD ["nginx", "-g", "daemon off;"]
