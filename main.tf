# Read the CSV file using an external data source
data "external" "csv_data" {
  program = ["python3", "${path.module}/read_csv.py", "${path.module}/databases.csv"]
}

locals {
  databases = jsondecode(data.external.csv_data.result.databases)
}

# Assuming these data sources are correctly set up in your environment
data "rediscloud_payment_method" "card" {
  card_type = "Visa"
}

data "rediscloud_essentials_plan" "plan" {
  name           = "Single-Zone_1GB"
  cloud_provider = "AWS"
  region         = "us-east-1"
}

# Loop to create subscriptions and databases
resource "rediscloud_essentials_subscription" "redis_subscription" {
  for_each         = { for db in local.databases : db["name"] => db }
  name             = "gabs-tf-essentials-subscription-${each.value["name"]}"
  plan_id          = data.rediscloud_essentials_plan.plan.id
  payment_method_id = data.rediscloud_payment_method.card.id
}

resource "rediscloud_essentials_database" "self_service_database" {
  for_each             = { for db in local.databases : db["name"] => db }
  subscription_id      = rediscloud_essentials_subscription.redis_subscription[each.key].id
  name                 = each.value["name"]
  memory_limit_in_gb   = each.value["memory"] / 1024.0 # assuming memory in CSV is in MB, converting to GB
  data_persistence     = "none"
  replication          = false
  enable_default_user  = true
  password             = each.value["password"]

  depends_on = [rediscloud_essentials_subscription.redis_subscription]
}
