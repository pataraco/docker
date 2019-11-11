# --- start the build phase ---

# start with alpine (base) image
# and build the app
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
# build the app (creates and builds into the build dir)
RUN npm run build

# --- start a run phase ---

# start with nginx (base) image
FROM nginx
# copy default nginx conf file
COPY nginx/default.conf /etc/nginx/conf.d/default.conf
# copy files from build phase
COPY --from=build_phase /var/local/app/build /usr/share/nginx/html
# expose listening port on the container
EXPOSE 3000
# start up nginx server
# no CMD needed, automatically started up / configured by the image
