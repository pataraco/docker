# fibonacci web server app

Messing around with Docker some more.

This project works with docker to test, build and start a unessisarily complex app to work with multiple containers and integrating them.

(Based on the Udemy course: "Docer and Kubernetes: The Complete Guide" by XXX starting at Section 8: "Building a Multi-Container Application"

## setup/use
These steps are not exact. Derived from a previous app (React App) from the same Udemy course.

### local dev

 1. brew install node
 2. mkdir fibo-web fibo-web/{client,server,worker,nginx}
 3. extract files Section: 9 Lecture: 116
 4. create {client,server,worker,nginx}/Dockerfil.dev files
 5. create nginx/default.conf file
 6. create docker-compose.yml file
 7. docker-compose up [--build]

### add CI/CD (Jenkins)

 1. AWS credentials in ~/.aws/config
 2. Docker Hub credentials as Jenkins environment vars in global config
 3. Create/Modify Jenkinsfile
 4. Jenkins
   * multibranch project
   * specify the correct Jenkinsfile
   * set up the GitHub creds (username/password) standard or Pers Access Token

### AWS config

 1. ElasticBeanstalk
   * Create the app and env (web server / multi-container docker)
   * Set up environment variables (Dockerrun.aws.json with resources below)
 2. AWS RDS (PostgreSQL)
   * Create an RDS DB (Dev/Test) (credentials/db name to match Dockerrun.aws.json)
     - small burstable instance, minimal memory and disk space
     - no extra anything, automatic backups, multi-az, enhanced monitoring
   * Create a AWS SG for PostgreSQL
 3. AWS Elastic Cache (Redis)
   * Create a Redis Cluster
     - zero replicas, no automatic backups
   * Create a AWS SG for Redis

### ElasticBeanstalk CLI

 1. install [AWS ElasticBeanstalk CLI (eb)](https://github.com/aws/aws-elastic-beanstalk-cli-setup.git)
 2. initialize the EB environment: `eb init [--profile PROFILE]`
 3. deploy to EB: `eb deploy [--staged]`  (in the Jenkinsfile)
