# Using a Node.js base image that also includes Nginx might require a custom image or installing Nginx manually
FROM node:20.16.0

# Install Nginx
RUN apt-get update && \
    apt-get install -y nginx && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /usr/share/nginx/html/*

# Set working directory for the application
WORKDIR /app

# Copy package.json and yarn.lock
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile

# Copy the entire project
COPY . .

# Build the Angular application
RUN yarn nx build web-app-1 --prod

# Copy the build output to Nginx's serving directory
RUN cp -r dist/apps/angular/web-app-1/browser/* /usr/share/nginx/html

# Copy custom Nginx configuration
COPY ./apps/angular/nginx.conf /etc/nginx/nginx.conf

# Expose port 80 for Nginx
EXPOSE 80

# Start Nginx when the container launches
CMD ["nginx", "-g", "daemon off;"]
