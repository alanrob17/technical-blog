# Stage 1
FROM alpine:latest AS build

# Set Hugo version
ARG HUGO_VERSION=0.121.1

# Install necessary packages
RUN apk add --no-cache wget tar libc6-compat libstdc++

# Download and install Hugo
RUN apk add --no-cache curl && \
    curl -L -o /tmp/hugo.tar.gz "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.tar.gz" && \
    tar -xzf /tmp/hugo.tar.gz -C /usr/bin hugo && \
    rm /tmp/hugo.tar.gz
	
WORKDIR /opt/HugoApp

# Copy Hugo config into the container Workdir.
COPY . .

# Run Hugo in the Workdir to generate HTML.
RUN hugo 

# Stage 2
FROM nginx:1.25-alpine

# Set workdir to the NGINX default dir.
WORKDIR /usr/share/nginx/html

# Copy HTML from previous build into the Workdir.
COPY --from=build /opt/HugoApp/public .

# Expose port 80
EXPOSE 80/tcp
