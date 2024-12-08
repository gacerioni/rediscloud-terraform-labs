# Data Source - Payment Method
data "rediscloud_payment_method" "card" {
  card_type = "Visa"
}

# Data Source - AWS Regions
data "rediscloud_regions" "aws_available_regions" {
  provider_name = "AWS"
}

# Create Redis Cloud Pro Subscription
resource "rediscloud_subscription" "pro_subscription" {
  name              = var.subscription_name
  payment_method    = "credit-card"
  payment_method_id = data.rediscloud_payment_method.card.id
  memory_storage    = "ram"
  redis_version     = "7.2"

  cloud_provider {
    provider = "AWS"  # AWS as the cloud provider
    region {
      region                       = var.region
      multiple_availability_zones  = true
      networking_deployment_cidr   = var.networking_deployment_cidr
      preferred_availability_zones = var.preferred_availability_zones
    }
  }

  # Creation Plan - Defines initial database for optimized hardware
  creation_plan {
    dataset_size_in_gb           = var.dataset_size_in_gb
    quantity                     = 1
    replication                  = var.replication
    throughput_measurement_by    = "operations-per-second"
    throughput_measurement_value = var.throughput_measurement_value
    modules                      = var.modules
  }

  maintenance_windows {
    mode = "manual"
    window {
      start_hour       = 2
      duration_in_hours = 4
      days             = ["Sunday"]
    }
  }
}

# Database Provisioning
resource "rediscloud_subscription_database" "pro_redis_database" {
  subscription_id            = rediscloud_subscription.pro_subscription.id
  name                       = var.database_name
  dataset_size_in_gb         = var.dataset_size_in_gb
  data_persistence           = var.data_persistence
  throughput_measurement_by  = "operations-per-second"
  throughput_measurement_value = var.throughput_measurement_value
  replication                = var.replication
  enable_default_user        = false
  enable_tls                 = var.enable_tls
  tags                       = var.tags

  modules = [
    for module in var.modules : { name = module }
  ]

  alert {
    name  = "dataset-size"
    value = 40
  }
}

# ACL Role Creation
resource "rediscloud_acl_role" "acl_role" {
  name = "${var.database_name}-role"
  rule {
    name = var.acl_rule_name
    database {
      subscription = rediscloud_subscription.pro_subscription.id
      database     = rediscloud_subscription_database.pro_redis_database.db_id
    }
  }

  depends_on = [rediscloud_subscription_database.pro_redis_database]
}

# ACL User Creation
resource "rediscloud_acl_user" "acl_user" {
  name     = "${var.database_name}-user"
  role     = rediscloud_acl_role.acl_role.name
  password = var.user_password

  depends_on = [rediscloud_acl_role.acl_role]
}

# AWS VPC Peering Request
resource "rediscloud_subscription_peering" "aws_peering" {
  subscription_id = rediscloud_subscription.pro_subscription.id
  region          = var.vpc_peering_region
  aws_account_id  = var.aws_account_id
  vpc_id          = var.aws_vpc_id
  vpc_cidr        = var.consumer_cidr
}

# AWS VPC Peering Accepter
resource "aws_vpc_peering_connection_accepter" "aws_peering_accepter" {
  vpc_peering_connection_id = rediscloud_subscription_peering.aws_peering.aws_peering_id
  auto_accept               = true
}