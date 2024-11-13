docker run -d \
    --name web-demo \
    -p 8080:80 \
    -v "$(pwd)/www:/usr/share/nginx/html" \
    basic-webserver
