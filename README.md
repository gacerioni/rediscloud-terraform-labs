# Terraform Configuration for Redis Cloud PRO Subscription and Database

This repository contains Terraform configurations for provisioning **a Redis Cloud PRO subscription and database from scratch**.

**The configuration is designed to:**

- Create a new Redis Cloud PRO subscription.
- Add a Redis Cloud PRO database within the subscription.
- Disable the default user to enhance security.
- Optionally enforce TLS connections based on configuration.
- Create a specific user with RBAC ACL for the database.
- Apply tags for metadata purposes.

---

## Overview

This Terraform setup simplifies the creation and management of Redis Cloud PRO subscriptions and databases. It includes essential security configurations, API integration, and support for custom database settings, user access, and security features such as TLS and RBAC.

## Prerequisites

- Terraform (or tofu) installed on your machine.
- Access to Redis Cloud API credentials.
- Access to AWS API credentials (`aws_access_key` and `aws_secret_key` will suffice).

## Variables (in constant evolution)

**The following input variables must be configured (_customizable to your needs_):**

- `redis_global_api_key`: Your Redis Cloud API key.
- `redis_global_secret_key`: Your Redis Cloud API secret key.
- `subscription_name`: The name of the Redis Cloud subscription to create.
- `cloud_account_id`: The ID of your cloud provider account linked to Redis Cloud. Optional, naturally.
- `database_name`: The name of the new Redis Cloud database to be created.
- `dataset_size_in_gb`: The dataset size limit in GB for the database.
- `throughput_measurement_value`: The desired throughput in operations per second.
- `replication`: Boolean to enable or disable replication (High Availability).
- `enable_tls`: Boolean to enable or disable TLS for database connections.
- `user_password`: The password for the specific user created for RBAC ACL.
- `tags`: A map of tags to associate with the subscription and database for metadata purposes.

---


## Key Features Configured

- **Disabling the Default User:** Enhances security by removing the default access credentials.
- **TLS Enforcement:** Optionally enforce TLS for secure connections to the database.
- **RBAC and ACL Configuration:** Creates a specific user and role with defined ACLs for controlled access to the database.
- **Tagging:** Allows you to apply custom tags for better resource organization and metadata management.

## Usage

**To use this Terraform configuration, follow these steps:**

1.	Clone the Repository and go to our current long-lived branch (I will fix this soon - I hate long lived branches lol):
```bash
git clone https://github.com/gacerioni/rediscloud-terraform-labs.git
cd rediscloud-terraform-labs
git checkout tf_pro_workshop
```

2.	Create a `terraform.tfvars` File:
```hcl
redis_global_api_key        = "your-api-key"
redis_global_secret_key     = "your-secret-key"
aws_access_key              = "your_aws_access_key"
aws_secret_key              = "your_aws_secret_key"
subscription_name           = "your-subscription-name"
cloud_account_id            = "6415"
database_name               = "your-database-name"
dataset_size_in_gb          = 1
throughput_measurement_value= 1000
replication                 = true
enable_tls                  = true
user_password               = "Secret).42"
tags = {
  environment = "dev"
  project     = "my-project"
  owner       = "your-name"
}
```

3.	Initialize Terraform and do the magic:
```bash
terraform init
terraform plan
terraform apply
<...>
terraform destroy
```

*⚠️ Important:*
- Replace your-api-key and your-secret-key with your Redis Cloud API credentials.
- **AWS API** is only needed because I demo a VPC Peering, and accepting the Peering Request is a required step for our TF Provider logic.
  - If you don't want this, just comment out lines [#L97](https://github.com/gacerioni/rediscloud-terraform-labs/blob/tf_pro_workshop/main.tf#L97) - #L109 (the tail of the `main.tf` file)
- Use a meaningful subscription_name and database_name relevant to your project.
- Set `cloud_account_id = 1` to use Redis Managed AWS Acc and VPC. Use the [https://api.redislabs.com/v1/cloud-accounts](https://api.redislabs.com/v1/swagger-ui/index.html) if you have your own *Cloud Account* in Redis Cloud.



## Security Note

- **Sensitive Variables:** Ensure that sensitive information like redis_global_api_key, redis_global_secret_key, and user_password are stored securely. Do not commit these to version control.
- **State File Security:** Be cautious with the Terraform state file (terraform.tfstate), as it may contain sensitive information.


## Contributing

Contributions to this project are welcome. Please ensure to follow the standard Git workflow and submit pull requests for any changes.

## License

This project is licensed under the MIT License - see the LICENSE file for details.


redis-cli --tls -h redis-19868.c35329.us-east-1-mz.ec2.cloud.rlrcp.com -p 19868 --user gabs-db-user --pass "Secret).42"