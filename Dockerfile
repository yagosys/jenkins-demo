FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \ 
    apt-get install -y --no-install-recommends tzdata
RUN apt-get update && \
  apt-get -y install apache2 

RUN echo 'Hello  world' > /var/www/html/index.html


EXPOSE 80

CMD /root/run_apache.sh
