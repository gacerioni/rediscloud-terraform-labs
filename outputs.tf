output "rediscloud_payment_method_card_data" {
  value = data.rediscloud_payment_method.card
}

#output "rediscloud_aws_available_regions" {
#  value = data.rediscloud_regions.aws_available_regions
#}

output "rediscloud_subscription_id" {
  description = "The ID of the Redis Cloud subscription"
  value       = rediscloud_subscription.pro_subscription.id
}

output "rediscloud_subscription_name" {
  description = "The name of the Redis Cloud subscription"
  value       = rediscloud_subscription.pro_subscription.name
}

output "rediscloud_database_id" {
  description = "The ID of the Redis Cloud database"
  value       = rediscloud_subscription_database.pro_redis_database.id
}

output "rediscloud_database_name" {
  description = "The name of the Redis Cloud database"
  value       = rediscloud_subscription_database.pro_redis_database.name
}

output "rediscloud_database_public_endpoint" {
  description = "The public endpoint of the Redis Cloud database"
  value       = rediscloud_subscription_database.pro_redis_database.public_endpoint
}

output "rediscloud_database_private_endpoint" {
  description = "The private endpoint of the Redis Cloud database"
  value       = rediscloud_subscription_database.pro_redis_database.private_endpoint
}

output "rediscloud_database_replication" {
  description = "Whether replication is enabled for the Redis Cloud database"
  value       = rediscloud_subscription_database.pro_redis_database.replication
}

output "rediscloud_database_tls_enabled" {
  description = "Whether TLS is enabled for the Redis Cloud database"
  value       = rediscloud_subscription_database.pro_redis_database.enable_tls
}

output "rediscloud_database_protocol" {
  description = "The protocol used by the Redis Cloud database (e.g., Redis RESP version)"
  value       = rediscloud_subscription_database.pro_redis_database.protocol
}

output "rediscloud_database_memory_limit_in_gb" {
  description = "The memory limit in GB for the Redis Cloud database"
  value       = rediscloud_subscription_database.pro_redis_database.memory_limit_in_gb
}

output "rediscloud_database_throughput_measurement" {
  description = "The throughput measurement value in operations-per-second"
  value       = rediscloud_subscription_database.pro_redis_database.throughput_measurement_value
}

output "rediscloud_database_username" {
  description = "The username for the Redis Cloud database"
  value       = rediscloud_acl_user.acl_user.name
}
output "rediscloud_database_password" {
  description = "The password for the Redis Cloud database (DEBUG)"
  value       = rediscloud_acl_user.acl_user.password
  sensitive   = true
}

output "rediscloud_peering_status" {
  description = "The status of the Redis Cloud VPC peering connection"
  value       = rediscloud_subscription_peering.aws_peering.status
}

output "aws_vpc_peering_id" {
  description = "The ID of the AWS VPC peering connection"
  value       = rediscloud_subscription_peering.aws_peering.aws_peering_id
}

#output "all_regions" {
#  value = data.rediscloud_regions.all_available_regions.regions
#}

/*
output "rediscloud_subscription" {
  value = data.rediscloud_subscription.existing_aws_us_east_1_sub_via_mktplace.id
}

output "rediscloud_database_modules" {
  value = data.rediscloud_database_modules.avail_modules.modules
}

output "rediscloud_database_id" {
  description = "The ID of the Redis Cloud database"
  value       = rediscloud_subscription_database.pro_redis_database.id
}
output "rediscloud_database_name" {
  description = "The name of the Redis Cloud database"
  value       = rediscloud_subscription_database.pro_redis_database.name
}

output "rediscloud_database_public_endpoint" {
  description = "The public endpoint of the Redis Cloud database"
  value       = rediscloud_subscription_database.pro_redis_database.public_endpoint
}

output "rediscloud_database_private_endpoint" {
  description = "The private endpoint of the Redis Cloud database"
  value       = rediscloud_subscription_database.pro_redis_database.private_endpoint
}

output "rediscloud_database_replication" {
  description = "Whether replication is enabled for the Redis Cloud database"
  value       = rediscloud_subscription_database.pro_redis_database.replication
}

output "rediscloud_database_tls_enabled" {
  description = "Whether TLS is enabled for the Redis Cloud database"
  value       = rediscloud_subscription_database.pro_redis_database.enable_tls
}

output "rediscloud_database_protocol" {
  description = "The protocol used by the Redis Cloud database (e.g., Redis RESP version)"
  value       = rediscloud_subscription_database.pro_redis_database.protocol
}

output "rediscloud_database_memory_limit_in_gb" {
  description = "The memory limit in GB for the Redis Cloud database"
  value       = rediscloud_subscription_database.pro_redis_database.memory_limit_in_gb
}

output "rediscloud_database_throughput_measurement" {
  description = "The throughput measurement value in operations-per-second"
  value       = rediscloud_subscription_database.pro_redis_database.throughput_measurement_value
}

output "rediscloud_database_user_password" {
  description = "The user password for the Redis Cloud database"
  value       = rediscloud_subscription_database.pro_redis_database.password
  sensitive   = true
}

output "rediscloud_acl_rule" {
  value = data.rediscloud_acl_rule.acl_rule.id
}
*/
