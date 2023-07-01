FROM debian:11.7

#RUN sed -i "s@http://deb.debian.org@http://repo.huaweicloud.com@g" /etc/apt/sources.list
#RUN sed -i "s@http://security.debian.org@http://repo.huaweicloud.com@g" /etc/apt/sources.list
RUN apt-get update
RUN apt-get install  ca-certificates -y

RUN sed -i "s@http://deb.debian.org@https://repo.huaweicloud.com@g" /etc/apt/sources.list
RUN sed -i "s@http://security.debian.org@https://repo.huaweicloud.com@g" /etc/apt/sources.list

ENV JAVA_HOME=/usr/local/jdk-11.0.2
ENV ANDROID_HOME=/usr/local/adk

WORKDIR /root
COPY prepare.sh /root
COPY init.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/init.sh
RUN sh prepare.sh



