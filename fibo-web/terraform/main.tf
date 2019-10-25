# Creates data lookups and common resources
#

terraform {
  backend "local" {}
  required_version = ">= 0.12.0"
}

provider "aws" {
  region = "us-east-1"
}

data "aws_route53_zone" "ijgbm" {
  name = "ijustgottabe.me"
}

data "aws_elastic_beanstalk_hosted_zone" "ue1" {
  region = "us-east-1"
}

data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default.id
  name   = "default"
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "redis" {
  name        = "fibo-web-app-redis"
  description = "Allow Redis inbound traffic from EB Cluster"
  vpc_id      = data.aws_vpc.default.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "To Any"
  }

  tags = {
    Name        = "fibo-web-app-redis"
    Environment = "dev"
  }
}

resource "aws_security_group_rule" "redis" {
  type                     = "ingress"
  description              = "Redis"
  from_port                = aws_elasticache_cluster.ec_redis.cache_nodes.0.port
  to_port                  = aws_elasticache_cluster.ec_redis.cache_nodes.0.port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.redis.id
  source_security_group_id = module.eb_env.security_group_id
}

resource "aws_security_group" "rds" {
  name        = "fibo-web-app-rds"
  description = "Allow Redis inbound traffic from EB Cluster"
  vpc_id      = data.aws_vpc.default.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "To Any"
  }

  tags = {
    Name        = "fibo-web-app-rds"
    Environment = "dev"
  }
}

resource "aws_security_group_rule" "rds" {
  type                     = "ingress"
  description              = "RDS"
  from_port                = module.rds_postgres.this_db_instance_port
  to_port                  = module.rds_postgres.this_db_instance_port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.rds.id
  source_security_group_id = module.eb_env.security_group_id
}

resource "aws_route53_record" "fibo" {
  zone_id = data.aws_route53_zone.ijgbm.zone_id
  name    = "fibo.ijustgottabe.me"
  type    = "A"

  alias {
    name                   = module.eb_env.endpoint
    zone_id                = data.aws_elastic_beanstalk_hosted_zone.ue1.id
    evaluate_target_health = true
  }
}
