# react app 

Messing around with Docker.

This project works with docker to test, build and start a simple react app and
also uses Jenkins to auto deploy.

## setup/use
 1. brew install node
 2. npm install -g create-react-app
 3. create-react-app frontend
 4. cd frontend
 4. npm test
 5. npm run build
 6. npm start (dev)
 7. docker build -f Dockerfile.dev
 8. rm -rf node_modules  # created by `npm run build`, not needed because
                         # will be created with `RUN npm install` in Dockerfile
 9. docker build -f Dockerfile.dev
10. docker run \
       -v /var/local/app/node_modules \  # don't map volume, use container's
       -v $(pwd):/var/local/app \        # map server volume to container's
       -p 8083:3000 IMAGE
11. docker-compose up
12. docker exec -it frontend_react-app_1 npm test

