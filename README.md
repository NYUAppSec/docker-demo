# Docker Demo

## Overview
This demo provides a hands-on introduction to Docker by building and running a simple web server. You'll learn the basic steps of containerization and how to manage files between your computer and the container.

### What You'll Learn
* Build a Docker image from a Dockerfile
* Run a container from your image
* Share files between your computer and the container
* Basic Docker CLI commands and what their flags mean

## Prerequisites
* Docker installed on your machine - [check these instructions](https://docs.docker.com/engine/install/)
* Basic command line familiarity

## Files We'll Create
```
your-working-directory/
├── Dockerfile         # Instructions for building our image
└── www/              # Directory containing our web content
    └── index.html    # A simple webpage
```

## Step-by-Step Instructions

### 1. Create Project Structure
First, create a directory for your web content:
```bash
mkdir www
```

### 2. Create a Simple Webpage
Create `www/index.html` with this content:
```html
<h1>AppSec Docker Demo</h1>
If you change this file, the changes should appear immediately.
Test Number: 42
```

### 3. Create the Dockerfile
Create a file named `Dockerfile` (no extension) with this content:
```dockerfile
FROM nginx:alpine
LABEL description="Basic web server demo"
WORKDIR /usr/share/nginx/html
EXPOSE 80
```

### 4. Build Your Docker Image
```bash
docker build -t basic-webserver .
```
What these flags mean:
* `-t basic-webserver`: Names your image "basic-webserver"
* `.`: Looks for a Dockerfile in the current directory

### 5. Run Your Container
```bash
docker run -d \
    --name web-demo \
    -p 8080:80 \
    -v "$(pwd)/www:/usr/share/nginx/html" \
    basic-webserver
```
What these flags mean:
* `-d`: Runs in background (detached mode)
* `--name web-demo`: Names your container "web-demo"
* `-p 8080:80`: Maps your computer's port 8080 to container's port 80
* `-v "$(pwd)/www:/usr/share/nginx/html"`: Maps your www folder to container's web folder

### 6. Test It Out
1. Open http://localhost:8080 in your browser
2. Try editing www/index.html
3. Refresh your browser to see the changes

### 7. Clean Up When Done
```bash
# Stop the container
docker stop web-demo

# Remove the container
docker rm web-demo

# (Optional) Remove the image
docker rmi basic-webserver
```

## What We Used

### nginx:alpine
* nginx: A popular web server
* alpine: A small Linux distribution (makes our image smaller)

### Port Mapping (-p 8080:80)
* 8080: Port on your computer
* 80: Port inside Docker container
* Lets you access the web server through localhost:8080

### File Sharing (-v flag)
* Maps a directory on your computer to one in the container
* Changes to files are visible immediately
* Files persist even if container is removed

## Common Issues
* "Port already in use": Change 8080 to another number
* "Permission denied": You might need to run Docker with sudo
* Can't see your changes: Make sure you're editing files in the www directory

## Next Steps
After mastering these basics, you can explore:
* Container security
* Multi-container applications
* Docker networking
* Container orchestration
* Image scanning and signing
