# Name the node stage "build"
FROM node:18
# AS build
# Set working directory
WORKDIR /var/www/html
# Copy all files from current directory to working dir in image
COPY . .
# install node modules and build assets
RUN apt update -y && \
    apt install apache2 -y
#    npm install && \
#    npm install @angular/cli@8 -g && \ 
#    ng build --prod
COPY app.conf /etc/apache2/sites-available/ 

ENTRYPOINT ["/bin/sh","/var/www/html/script.sh"]
