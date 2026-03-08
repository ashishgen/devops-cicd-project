# Use a lightweight NGINX image
FROM nginx:alpine

# Copy custom index.html to serve as homepage
COPY index.html /usr/share/nginx/html/index.html
