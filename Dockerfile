FROM ubuntu:16.04

RUN apt-get update \
   && apt-get install -y curl \
   && apt-get install -y vim \
   && apt-get install -y cron \
   && apt-get install -y iputils-ping \
   && apt-get install -y telnet

USER root

# set timezone
ENV TZ 'Asia/Ho_Chi_Minh'
RUN echo $TZ > /etc/timezone && \
    apt-get update && apt-get install -y tzdata && \
    rm /etc/localtime && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get clean

# install node version 13.*
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash - \
    && apt-get install -y nodejs 
RUN npm install -g nodemon
# result installation
RUN node -v
RUN npm -v
RUN nodemon -v

WORKDIR /var/www/html/backend/

CMD ["npm", "start"]

# CMD ["/etc/init.d/cron", "start"]