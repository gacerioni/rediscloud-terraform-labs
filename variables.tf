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

variable "dataset_size_in_gb" {
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

variable "acl_rule_name" {
  type        = string
  description = "Lets use Full-Acess for now"
  default     = "Full-Access"
}

variable "enable_tls" {
  type        = bool
  description = "Enable TLS for the database"
  default     = false
}

variable "tags" {
  type        = map(string)
  description = "Custom tags for the database"
  default     = {
    "market" = "brazil"
  }
}

variable "user_password" {
  type        = string
  description = "Password for the ACL user"
  sensitive   = true
  default     = "G4bZ.N3rd0l4!"
}
