# Creates data lookups and common resources
#

provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_security_group" "default" {
  vpc_id = data.aws_vpc.default.id
  name   = "default"
}

resource "aws_security_group" "redis" {
  name        = "fibo-web-app-redis"
  description = "Allow Redis inbound traffic from EB Cluster"
  vpc_id      = data.aws_vpc.default.id

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    description     = "To Any"
  }

  tags = {
    Name        = "fibo-web-app-redis"
    Environment = "dev"
  }
}

resource "aws_security_group_rule" "redis" {
  type                     = "ingress"
  description              = "Redis"
  from_port                = 6379
  to_port                  = 6379
  protocol                 = "tcp"
  security_group_id        = aws_security_group.redis.id
  self                     = true
  source_security_group_id = module.eb_env.security_group_id
}
