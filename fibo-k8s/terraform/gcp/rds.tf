# Creates an Amazon Relational Database Service (RDS) PostgreSQL DB resource
#
# originaly grabbed (and heavily modified) config(s) from the terraform module
# example(s)


# Modules/Resources

# PostgreSQL AWS RDS DB Instance
module "rds_postgres" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 2.0"

  allocated_storage       = 10
  backup_retention_period = 0 # disable backups to create DB faster
  backup_window           = "03:00-06:00"
  deletion_protection     = false
  engine                  = "postgres"
  engine_version          = "9.6.15"
  family                  = "postgres9.6"
  identifier              = "fibo-web-app"
  instance_class          = "db.t3.small"
  maintenance_window      = "Mon:00:00-Mon:03:00"
  name                    = "postgres" # database name
  password                = "postgres_password"
  port                    = "5432"
  skip_final_snapshot     = true
  storage_encrypted       = false
  subnet_ids              = data.aws_subnet_ids.all.ids
  username                = "postgres"
  vpc_security_group_ids  = [data.aws_security_group.default.id, aws_security_group.rds.id]

  tags = {
    Environment = "dev"
  }
}


# Outputs

output "rds_db_instance_endpoint" {
  description = "The connection endpoint"
  value       = module.rds_postgres.this_db_instance_endpoint
}

output "rds_db_instance_name" {
  description = "The database name"
  value       = module.rds_postgres.this_db_instance_name
}

output "rds_db_instance_username" {
  description = "The master username for the database"
  value       = module.rds_postgres.this_db_instance_username
}

output "rds_db_instance_password" {
  description = "The database password (this password may be old, because Terraform doesn't track it after initial creation)"
  value       = module.rds_postgres.this_db_instance_password
}

output "rds_db_instance_port" {
  description = "The database port"
  value       = module.rds_postgres.this_db_instance_port
}
