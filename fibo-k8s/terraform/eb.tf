# Creates AWS Elastic Beanstalk resources (Application and Environment)
#
# originaly grabbed configs from the terraform module example


# Modules/Resources

# AWS Elastic Beanstalk Application
module "eb_app" {
  source  = "cloudposse/elastic-beanstalk-application/aws"
  version = "0.4.0"

  name        = "fibo-web-app"
  description = "Testing application: Udemy course: Docker and Kubernetes: The Complete Guide - fibonacci app"

  tags = {
    Environment = "dev"
  }
}

# AWS Elastic Beanstalk Environment

# values for solution_stack_name can be found here:
#   docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html

module "eb_env" {
  source  = "cloudposse/elastic-beanstalk-environment/aws"
  version = "0.17.0"

  application_subnets                = data.aws_subnet_ids.all.ids
  autoscale_max                      = 2
  autoscale_min                      = 1
  description                        = "Testing environment: Udemy course: Docker and Kubernetes: The Complete Guide - fibonacci app"
  elastic_beanstalk_application_name = module.eb_app.elastic_beanstalk_application_name
  environment_type                   = "SingleInstance"
  instance_type                      = "t3.small"
  logs_delete_on_terminate           = true
  name                               = "fibo-web-app-env"
  region                             = "us-east-1"
  rolling_update_type                = "Time"
  root_volume_size                   = 20
  root_volume_type                   = "gp2"
  solution_stack_name                = "64bit Amazon Linux 2018.03 v2.17.0 running Multi-container Docker 18.06.1-ce (Generic)"
  tier                               = "WebServer" # default (WebServer or Worker)
  updating_min_in_service            = 0
  vpc_id                             = data.aws_vpc.default.id
}


# Outputs

output "eb_app_name" {
  description = "AWS Elastic Beanstalk Application name"
  value       = module.eb_app.elastic_beanstalk_application_name
}

output "eb_env_name" {
  description = "AWS Elastic Beanstalk Application Environment name"
  value       = module.eb_env.name
}

output "eb_env_endpoint" {
  description = "Fully qualified DNS name for the environment"
  value       = module.eb_env.endpoint
}

output "eb_env_security_group_id" {
  description = "Security Group ID of the Environment"
  value       = module.eb_env.security_group_id
}
