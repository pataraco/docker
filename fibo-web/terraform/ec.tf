# Creates an Amazon ElastiCache Redis resource
#
# originally grabbed configs from the terraform module example


# Modules/Resources

# Amazon ElastiCache Redis
resource "aws_elasticache_cluster" "ec_redis" {
  cluster_id           = "fibo-web-app"
  engine               = "redis"
  node_type            = "cache.t2.small"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis5.0"
  engine_version       = "5.0.5"
  port                 = 6379
  security_group_ids   = [aws_security_group.redis.id]
  tags = {
    Environment = "dev"
  }
}


# Outputs

output "ec_redis_endpoint" {
  description = "Redis host endpoint"
  value       = aws_elasticache_cluster.ec_redis.cache_nodes.0.address
}

output "ec_redis_port" {
  description = "Redis host port"
  value       = aws_elasticache_cluster.ec_redis.cache_nodes.0.port
}
