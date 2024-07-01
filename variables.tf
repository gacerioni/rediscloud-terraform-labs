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

# USE THIS IF YOU WANT TO USE THE VAULT SECRETS ENGINE
/*
variable "vault_full_addr" {
  description = "The Vault Server used for this Lab."
  type        = string
  default     = "http://vaultgabs.redisdemo.com:8200"
}

variable "vault_root_token" {
  description = "The Vault Root Token used for this Lab."
  type        = string
  sensitive   = true
}

variable "vault_kv_path_and_key" {
  description = "The path where the secrets are kept, under a kv v2 engine."
  type        = string
  sensitive   = true
  default = "secret/redis-quintoandar-lab"
}
*/