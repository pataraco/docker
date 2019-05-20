# start with node alpine (base) image
# and build the app
FROM node:current-alpine as builder
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

# start up nginx server
# start with nginx alpine (base) image
FROM nginx:alpine
# copy remaining config files over
# note: remapped by docker-compose, not really needed, but saved for reference
COPY --from=builder /var/local/app/build /usr/share/nginx/html
# no CMD needed, automatically started up / configured by the image
