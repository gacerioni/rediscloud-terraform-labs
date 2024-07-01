output "rediscloud_subscription" {
  value = { for name, sub in rediscloud_essentials_subscription.redis_subscription : name => sub.id }
}

output "rediscloud_subscription_database_id" {
  value = { for name, db in rediscloud_essentials_database.self_service_database : name => db.id }
}

output "rediscloud_subscription_database_name" {
  value = { for name, db in rediscloud_essentials_database.self_service_database : name => db.name }
}

output "rediscloud_essentials_plan" {
  value = data.rediscloud_essentials_plan.plan.id
}

output "rediscloud_selfservice_created_database_endpoint" {
  value = { for name, db in rediscloud_essentials_database.self_service_database : name => db.public_endpoint }
}

output "database_csv_details" {
  value = { for db in local.databases : db["name"] => {
    memory   = db["memory"]
    port     = db["port"]
    password = db["password"]
  }}
}
