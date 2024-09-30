data "rediscloud_subscription" "existing_aws_us_east_1_sub_via_mktplace" {
  name = "BARCLAYS-PRO-AWS"
}


// The primary database to provision
resource "rediscloud_subscription_database" "database-pro-gabs" {
    subscription_id = data.rediscloud_subscription.existing_aws_us_east_1_sub_via_mktplace.id
    name = "test-db"
    memory_limit_in_gb = 1
    data_persistence = "aof-every-write"
    throughput_measurement_by = "operations-per-second"
    throughput_measurement_value = 1000
    replication = true

    modules = [
        {
          name = "RedisJSON"
        }
    ]

    alert {
      name = "dataset-size"
      value = 40
    }
}
