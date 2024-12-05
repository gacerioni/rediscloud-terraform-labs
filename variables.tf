variable "redis_global_api_key" {
  description = "Global API key for Redis Cloud account"
  type        = string
  default     = "incorrect"
  sensitive   = true
}

variable "redis_global_secret_key" {
  description = "Global API Secret (USER KEY) for Redis Cloud account"
  type        = string
  default     = "incorrect"
  sensitive   = true
}

variable "subscription_name" {
  description = "The name of the RedisCloud subscription"
  type        = string
}

variable "database_name" {
  description = "The name of the RedisCloud database"
  type        = string
  default     = "test-db"
}

variable "dataset_size_in_gb" {
  description = "Memory limit in GB for the database"
  type        = number
  default     = 5
}

variable "data_persistence" {
  description = "Data persistence setting"
  type        = string
  default     = "none"
}

variable "throughput_measurement_value" {
  description = "Throughput measurement in operations per second"
  type        = number
  default     = 5000
}

variable "modules" {
  description = "List of Redis modules to enable"
  type        = list(string)
  default     = ["RedisJSON", "RediSearch", "RedisBloom", "RedisTimeSeries"]
}

variable "replication" {
  description = "Whether or not replication should be enabled"
  type        = bool
  default     = false
}

variable "acl_rule_name" {
  description = "ACL rule name for the database"
  type        = string
  default     = "Full-Access"
}

variable "enable_tls" {
  description = "Enable TLS for the database"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Custom tags for the database"
  type        = map(string)
  default     = {
    "market" = "emea"
  }
}

variable "user_password" {
  description = "Password for the ACL user"
  type        = string
  sensitive   = true
  default     = "G4bZ#N3rd0l4!"
}

variable "region" {
  description = "AWS region for the subscription"
  type        = string
  default     = "us-east-1"
}

variable "preferred_availability_zones" {
  description = "Preferred availability zones for the subscription"
  type        = list(string)
  #default     = ["use-az1", "use-az2", "use-az3"]
  #default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
  default = []
}

variable "networking_deployment_cidr" {
  description = "CIDR block for the subscription networking deployment"
  type        = string
  default     = "10.123.42.0/24"
}