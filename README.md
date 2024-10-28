# Terraform Configuration for Redis Cloud PRO Database in Existing Subscription

This repository contains Terraform configurations for provisioning and managing **Redis Cloud PRO databases within an existing subscription**.

**The configuration is designed to:**

- Create a new database in an existing PRO subscription using details provided via input variables.
- Disable the default user to enhance security.
- Optionally enforce TLS connections based on configuration.
- Create a specific user with RBAC ACL for the database.
- Apply tags for metadata purposes.


## Overview

The Terraform setup provided here simplifies the creation and management of Redis Cloud PRO databases, including essential security configurations and API integration.\
It allows for fine-grained control over database settings, user access, and security features such as TLS and RBAC.

## Prerequisites

- Terraform (or tofu) installed on your machine.
- Access to an existing Redis Cloud PRO subscription.
- Redis Cloud API key and secret key.

## Variables (in constant evolution)

**The following input variables can be configured (_easily adjustable for your needs_):**

- `redis_global_api_key`: Your Redis Cloud API key.
- `redis_global_secret_key`: Your Redis Cloud API secret key.
- `subscription_name`: The name of the existing Redis Cloud subscription.
- `database_name`: The name of the new Redis Cloud database to be created.
- `dataset_size_in_gb`: The dataset size limit in GB for the database.
- `throughput_measurement_value`: The desired throughput in operations per second.
- `replication`: Boolean to enable or disable replication (High Availability).
- `enable_tls`: Boolean to enable or disable TLS for database connections.
- `user_password`: The password for the specific user created for RBAC ACL.
- `tags`: A map of tags to associate with the database for metadata purposes.
- `acl_rule_name`: The name of the ACL rule to apply (e.g., “Full-Access”).


## Key Features Configured

- **Disabling the Default User:** Enhances security by removing the default access credentials.
- **TLS Enforcement:** Optionally enforce TLS for secure connections to the database.
- **RBAC and ACL Configuration:** Creates a specific user and role with defined ACLs for controlled access to the database.
- **Tagging:** Allows you to apply custom tags for better resource organization and metadata management.

## Usage

**To use this Terraform configuration, follow these steps:**

1.	Clone the Repository and go to our current long-lived branch (I will fix this soon - I hate long lived branches lol):
```bash
git clone https://github.com/gacerioni/rediscloud-terraform-essentials-db-creator.git
cd rediscloud-terraform-essentials-db-creator
git checkout existing_pro_sub
```

2.	Create a `terraform.tfvars` File:
```bash
redis_global_api_key        = "your-api-key"
redis_global_secret_key     = "your-secret-key"
subscription_name           = "existing-subscription-name"
database_name               = "your-database-name"
dataset_size_in_gb          = 0.5
throughput_measurement_value= 500
replication                 = false
enable_tls                  = true
user_password               = "your-secure-password"
tags = {
  environment = "dev"
  project     = "my-project"
  owner       = "gabs-the-creator"
}
acl_rule_name               = "Full-Access"
```

3.	Initialize Terraform and do the magic:
```bash
terraform init
terraform plan
terraform apply
<...>
terraform destroy
```

## Security Note

- **Sensitive Variables:** Ensure that sensitive information like redis_global_api_key, redis_global_secret_key, and user_password are stored securely. Do not commit these to version control.
- **State File Security:** Be cautious with the Terraform state file (terraform.tfstate), as it may contain sensitive information.


## Contributing

Contributions to this project are welcome. Please ensure to follow the standard Git workflow and submit pull requests for any changes.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
