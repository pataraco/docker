# Fibonacci Web Server App (kubernetes)

**NOTE**: WIP - This README is **NOT** complete and the steps have to be validated!

Messing around with Kubernetes.

This project works with kubernetes to test, build and start an unnecessarily
complex app to work with multiple containers and integrating them.

Based on the Udemy course:
[Docker and Kubernetes: The Complete Guide](https://www.udemy.com/course/docker-and-kubernetes-the-complete-guide)
by [Stephen Grider](https://www.udemy.com/user/sgslo/)
starting at *Section 12: "Onwards to Kubernetes!"*
project begins at *Section 16: "Kubernetes Production Deployment"*

## Pre-requisites (before you begin)

### Packages/Applications (Mac O.S.)
- node (`brew install node`)
- docker (`App Store install: Docker Desktop`)
- terraform (`brew install terraform`)
- git (`brew install git`)

### Clone the repo
 `git clone https://www.github/pataraco/d4r-k8s.git`

### CI/CD Server
I'm using a `Jenkins` server for CI/CD. You'll need to set up your own CI/CD
server and configure it properly to work with this project. If you do use
`Jenkins`, at least you'll get a (good?) example of a `Jenkinsfile`.

### Adding a Jenkins CI/CD Server/Project
 1. AWS credentials in ~/.aws/config (TODO: or GCP credentials [wherever they go])
 2. Docker Hub credentials as Jenkins environment vars in global config
 3. Create/Modify Jenkinsfile
 4. Jenkins
   * multibranch project
   * specify the correct Jenkinsfile (in `fibo-k8s` directory)
   * set up the GitHub creds (username/password) standard or Pers Access Token

## Usage

### Local Deployment (and Development)
These steps assume you are using `MAC O.S.` and `Docker for Desktop` (you can also use `minikube`).

1. Make sure your `kube config` is properly set up and that you are using the specific context in which you want to create/deploy containers in to
  * `kubectl config get-contexts`
  * `kubectl config current-context`
  * `kubectl config use-context CONTEXT`
2. Create the project's namespace (apply the namespace config)
  * `kubectl apply -f kubernetes/fibo-namespace.yaml`
3. Change the password in the postgres secrets config
  * `vi kubernetes/postgres/postgres-secrets.yaml`
4. Deploy the containers (apply the configs)
  * `kubectl apply -f kubernetes/postgres`
  * `kubectl apply -f kubernetes/redis`
  * `kubectl apply -f kubernetes/server`
  * `kubectl apply -f kubernetes/worker`
  * `kubectl apply -f kubernetes/client`
5. Deploy `nginx` ingress (go to `kubenetes/ingress-nginx` github and follow [instructions](https://kubernetes.github.io/ingress-nginx/deploy/) for deployment)
6. Set up up the `kubernetes dashboard` [GitHub:kubernetes/dashboard](https://github.com/kubernetes/dashboard)
  * Follow instructions for `local` set up and use the following arguments:

   ```
   args:
     - --auto-generate-certificates
     - --enable-skip-login
     - --disable-settings-authorizer
   ```

### GCP Deployment

#### Automated (Terraform)
**TODO:TBD**

**Note**: The `terraform` configs are specific to my environment. You'll have
to change the "hard-coded" values (that's right - I didn't parameterize! :-p)

 1. Change working directory to `terraform/gcp`
   * `cd terraform/gcp`
 2. Initialize `terraform`
   * `terraform init`
 3. Apply the `terraform` configurations
   * `terraform apply`

#### Manual (GCP Console)
**WIP:Draft**
 1. log into GCP and create a project
 2. enable kubernetes engine and create a cluster
   - name / zonal / closest zone / 3 nodes / 1 vCPU / 3.75 GB

### AWS Deployment

#### Automated (Terraform)
**TODO:TBD**

**Note**: The `terraform` configs are specific to my environment. You'll have
to change the "hard-coded" values (that's right - I didn't parameterize! :-p)

 1. Change working directory to `terraform/aws`
   * `cd terraform/aws`
 2. Initialize `terraform`
   * `terraform init`
 3. Apply the `terraform` configurations
   * `terraform apply`

#### Manual (AWS Console)
**TODO:TBD**

 1. AWS VPC/Subnets/NAT GW/Security Groups
   * TBD
 2. AWS EKS
   * TBD
 3. AWS EC2 - Instances: K8S Worker Nodes
   * TBD
 4. AWS EC2 - Load Balancers: K8S Worker Nodes
   * TBD
 5. AWS Route 53
   * TBD
