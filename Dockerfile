FROM nginx:alpine
LABEL description="Basic web server demo with volume mount"

# We'll mount our local directory here
WORKDIR /usr/share/nginx/html

# Using alpine-based nginx for smaller image size
# Default nginx port is 80, but we'll document it explicitly
EXPOSE 80
