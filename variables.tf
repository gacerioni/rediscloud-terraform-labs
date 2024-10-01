variable "redis_global_api_key" {
  description = "Global API key for Redis Cloud account"
  type        = string
  default = "incorrect"
  sensitive   = true
}

variable "redis_global_secret_key" {
    description = "Global API Secret (USER KEY) for Redis Cloud account"
    type        = string
    default     = "incorrect"
    sensitive   = true
}

variable "subscription_name" {
  type        = string
  description = "The name of the RedisCloud subscription"
}

variable "database_name" {
  type        = string
  description = "The name of the RedisCloud database"
  default     = "test-db"
}

variable "memory_limit_in_gb" {
  type        = number
  description = "Memory limit in GB for the database"
  default     = 1
}

variable "data_persistence" {
  type        = string
  description = "Data persistence setting"
  default     = "none"
}

variable "throughput_measurement_value" {
  type        = number
  description = "Throughput measurement in operations per second"
  default     = 1000
}

variable "modules" {
  type        = list(string)
  description = "List of Redis modules to enable"
  default     = ["RedisJSON", "RediSearch", "RedisBloom", "RedisTimeSeries"]
}

variable "replication" {
  type        = bool
  description = "Whether or not replication should be enabled"
  default     = false
}