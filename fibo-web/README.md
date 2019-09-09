# fibonacci web server app 

Messing around with Docker some more.

This project works with docker to test, build and start a unessisarily complex app to work with multiple containers and integrating them.

(Based on the Udemy course: "Docer and Kubernetes: The Complete Guide" by XXX starting at Section 8: "Building a Multi-Container Application"

## setup/use
These steps are not exact. Derived from a previous app (React App) from the same Udemy course.

 1. brew install node
 2. mkdir fibo-web fibo-web/{client,server,worker,nginx}
 3. extract files Section: 9 Lecture: 116
 4. create {client,server,worker,nginx}/Dockerfil.dev files
 5. create nginx/default.conf file
 6. create docker-compose.yml file
 7. docker-compose up [--build]

TBD: maybe need these...
??. install [AWS ElasticBeanstalk CLI (eb)](https://github.com/aws/aws-elastic-beanstalk-cli-setup.git)
??. initialize the EB environment: `eb init [--profile PROFILE]`
??. deploy to EB: `eb deploy [--staged]`
