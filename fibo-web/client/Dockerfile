# start with alpine (base) image
FROM node:alpine as build_phase

# set working directory to not conflict
WORKDIR /var/local/app

# copy just the package file
# eliminates need to re-run 'npm install' unless changed
COPY package.json .

# install dependencies
# creates /var/local/app/node_modules
RUN npm install

# copy remaining config files over
# note: remapped by docker-compose, not really needed, but saved for reference
COPY . .

# tell the image to run the server when it starts as a container
CMD ["npm", "run", "build"]

# start a second phase

# start with nginx (base) image
FROM nginx

# expose listening port
EXPOSE 3000

# copy default nginx conf file
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# copy files from build phase
COPY --from=build_phase /var/local/app/build /usr/share/nginx/html
