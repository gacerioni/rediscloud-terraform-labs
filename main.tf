# Data sources
data "rediscloud_subscription" "existing_aws_us_east_1_sub_via_mktplace" {
  name = var.subscription_name
}

data "rediscloud_database_modules" "avail_modules" {}

data "rediscloud_acl_rule" "acl_rule" {
  name = var.acl_rule_name  # Allows for variable rule usage
}

# Database Provisioning
resource "rediscloud_subscription_database" "pro_redis_database" {
  subscription_id            = data.rediscloud_subscription.existing_aws_us_east_1_sub_via_mktplace.id
  name                       = var.database_name
  dataset_size_in_gb         = var.dataset_size_in_gb
  data_persistence           = var.data_persistence
  throughput_measurement_by  = "operations-per-second"
  throughput_measurement_value = var.throughput_measurement_value
  replication                = var.replication
  enable_default_user        = false  # Disable default user as per requirement
  enable_tls                 = var.enable_tls  # Boolean variable for TLS
  tags                       = var.tags  # String map of tags

  modules = [
      for module in var.modules : { name = module }
  ]

  alert {
    name  = "dataset-size"
    value = 40
  }
}

# ACL Role Creation after Database Provisioning
resource "rediscloud_acl_role" "acl_role" {
  name = "${var.database_name}-role"
  rule {
    name = data.rediscloud_acl_rule.acl_rule.name
    database {
      subscription = data.rediscloud_subscription.existing_aws_us_east_1_sub_via_mktplace.id
      database     = rediscloud_subscription_database.pro_redis_database.db_id
    }
  }

  # Ensure role creation happens after database is ready
  depends_on = [rediscloud_subscription_database.pro_redis_database]
}

# ACL User Creation after Role Creation
resource "rediscloud_acl_user" "acl_user" {
  name     = "${var.database_name}-user"
  role     = rediscloud_acl_role.acl_role.name
  password = var.user_password  # Secure variable or secret for password

  # Ensure user is created after role setup
  depends_on = [rediscloud_acl_role.acl_role]
}
