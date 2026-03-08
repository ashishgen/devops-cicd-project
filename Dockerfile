# Use official NGINX image
FROM nginx:alpine

# Remove default index.html
RUN rm /usr/share/nginx/html/index.html

# Add our custom index.html
RUN echo "Congratulations! You are halfway done with the PRT. Keep going." > /usr/share/nginx/html/index.html

# Expose port 80
EXPOSE 80
