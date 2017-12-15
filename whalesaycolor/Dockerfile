FROM docker/whalesay
RUN apt-get -y update && apt-get install -y fortunes
#COPY docker.cow /usr/share/cowsay/docker.cow
COPY docker.cow /tmp/docker.cow
#COPY /usr/share/cowsay/docker.cow /tmp/docker.cow
CMD /usr/games/fortune -a | cowsay -f /tmp/docker.cow
