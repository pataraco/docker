# start with alpine (base) image
FROM alpine

# update package list and upgrade all installed packeges
RUN apk upgrade

# install required packages
RUN apk add --update redis

# tell the image to run the server when it starts as a container
CMD ["redis-server"]
