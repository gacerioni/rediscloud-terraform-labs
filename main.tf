data "rediscloud_subscription" "existing_aws_us_east_1_sub_via_mktplace" {
  name = var.subscription_name
}


data "rediscloud_database_modules" "avail_modules" {
}


// The primary database to provision
resource "rediscloud_subscription_database" "pro_redis_database" {
    subscription_id = data.rediscloud_subscription.existing_aws_us_east_1_sub_via_mktplace.id
    name = var.database_name
    memory_limit_in_gb = var.memory_limit_in_gb
    data_persistence = var.data_persistence
    throughput_measurement_by = "operations-per-second"
    throughput_measurement_value = var.throughput_measurement_value
    replication = var.replication

    modules = [
        for module in var.modules : { name = module }
    ]

    alert {
      name = "dataset-size"
      value = 40
    }
}
