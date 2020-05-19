FROM docker/whalesay
RUN apt-get -y update && apt-get install -y fortunes
COPY docker-color.cow /cowsay/cows/docker-color.cow
CMD /usr/games/fortune -a | cowsay -f /cowsay/cows/docker-color.cow
