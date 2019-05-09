# start with alpine (base) image
FROM node:current-alpine

# set working directory to not conflict
WORKDIR /var/local/node

# copy just the package file
# eliminates need to re-run 'npm install' unless changed
COPY ./package.json ./

# install dependencies
RUN npm install

# copy remaining config files over
COPY ./ ./

# tell the image to run the server when it starts as a container
CMD ["npm", "start"]
