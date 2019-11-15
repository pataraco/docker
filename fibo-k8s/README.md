# fibonacci web server app (kubernetes)

**NOTE: WIP** This README is **NOT** complete!

- apply the namespace config
- change the password in the postgres secrets config
- apply the other configs
- go to kubenetes/ingress-nginx github and follow [instructions](https://kubernetes.github.io/ingress-nginx/deploy/) for deployment
- set up the [dashboard](https://github.com/kubernetes/dashboard)
   - local set up

   ```
   args:
     - --auto-generate-certificates
     - --enable-skip-login
     - --disable-settings-authorizer
  ```

**THE NOTES BELOW ARE OLD**

Messing around with Docker some more.

This project works with docker to test, build and start an unnecessarily complex app to work with multiple containers and integrating them.

Based on the Udemy course:
[Docker and Kubernetes: The Complete Guide](https://www.udemy.com/course/docker-and-kubernetes-the-complete-guide)
by [Stephen Grider](https://www.udemy.com/user/sgslo/)
starting at *Section 8: "Building a Multi-Container Application"*

## quick start
**Note**: The `terraform` configs are specific to my environment. You'll have to change the "hard-coded" values (that's right - I didn't parameterize! :-p)

 1. clone the repo
 2. run `terraform init` & `terraform apply` in `terraform` directory
 3. run `eb init` & `eb deploy` in `fibo-web` directory

## detailed setup/configuration/use
**Note**: These steps are not exact. Derived from a previous app (React App) from the same Udemy course.

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

### AWS infra config

#### automated via Terraform

 1. Change working directory to `terraform`
   * `cd terraform`
 2. Apply the `terraform` configurations (may need to run `terraform init` first)
   * `terraform apply`

#### manually via AWS Console

 1. AWS Elastic Beanstalk (Application and Environment)
   * Create the app and env (web server / multi-container docker)
   * Set up environment variables (Dockerrun.aws.json with resources below)
 2. Amazon RDS (PostgreSQL)
   * Create an RDS DB (Dev/Test) (credentials/db name to match Dockerrun.aws.json)
     - small burstable instance, minimal memory and disk space
     - no extra anything, automatic backups, multi-az, enhanced monitoring
   * Create a AWS SG for PostgreSQL
 3. Amazon ElastiCache (Redis)
   * Create a Redis Cluster
     - zero replicas, no automatic backups
   * Create a AWS SG for Redis

### AWS Elastic Beanstalk CLI (eb)

 1. install [AWS ElasticBeanstalk CLI (eb)](https://github.com/aws/aws-elastic-beanstalk-cli-setup.git)
 2. initialize the EB environment: `eb init [--profile PROFILE]`
 3. deploy to EB: `eb deploy [--staged]`  (in the Jenkinsfile)
