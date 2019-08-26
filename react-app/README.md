# react app 

Messing around with Docker.

This project works with docker to test, build and start a simple react app and
also uses Jenkins to auto deploy.

## setup/use
 1. brew install node
 2. npm install -g create-react-app
    (optional: npm install -g react-scripts)
 3. create-react-app frontend
 4. cd frontend
 5. npm [run] test
 6. npm run build
 7. npm [run] start (dev)
 8. docker build [-t USER/IMAGE_NAME:TAG] -f Dockerfile.dev .
 9. rm -rf node_modules  # created by `npm run build`, not needed because
                         # will be created with `RUN npm install` in Dockerfile
10. docker build [-t USER/IMAGE_NAME:TAG] -f Dockerfile.dev .
11. docker run \
       -v /var/local/app/node_modules \  # don't map volume, use container's
       -v $(pwd):/var/local/app \        # map server volume to container's
       -p 8083:3000 IMAGE
12. docker-compose up
13. docker exec -it frontend_react-app_1 npm test

