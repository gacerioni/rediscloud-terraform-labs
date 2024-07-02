# Terraform Configuration for Redis Cloud Database - DOC UNDER CONSTRUCTION

This repository contains Terraform configurations for setting up and managing databases in Redis Cloud.\
For this specific use case, a looper that will create multiple Essentials Subscriptions and Redis DBs.

**As you already know, currently, each Essentials Subscription can only have one DB.**

## Tutorial in English

[![Watch the video](https://img.youtube.com/vi/7BuzBFW7wKU/maxresdefault.jpg)](https://www.youtube.com/watch?v=7BuzBFW7wKU)

## Overview

The Terraform setup in this repository is designed to create and manage Redis Cloud database instances securely. It leverages HashiCorp Vault for storing sensitive information like database credentials and API keys.

## Prerequisites

- Terraform installed on your machine.
- Access to a Redis Cloud account.
- A HashiCorp Vault instance.

## Setting Up Vault

Before using this Terraform configuration, set up a KV store in your Vault instance:

1. Create a KV store named `secret`.
2. Add the following secrets (single entry, add the entire json) to the path `secret/redis-quintoandar-lab`:

    ```json
    {
      "db_0_pwd": "secret_42",
      "db_0_user": "default",
      "foo": "world",
      "global_api_key": "<THE_ACCOUNT_API_KEY>",
      "global_secret_key": "<YOUR_USER_API_KEY_THAT_BECOMES_THE_SECRET>"
    }
    ```

    Ensure to replace `<THE_ACCOUNT_API_KEY>` and `<YOUR_USER_API_KEY_THAT_BECOMES_THE_SECRET>` with your actual Redis Cloud account and user API keys.

## Configuration Variables

You will need to provide a Vault root token for Terraform to authenticate with Vault. This can be passed via an environment variable or a `terraform.tfvars` file.

Example `terraform.tfvars` content:

```
vault_root_token = "hvs.UDublablabla"
```

Place this file under `environments/dev/terraform.tfvars`.

## Usage

To use this Terraform configuration, follow these steps:

1. Initialize Terraform:

    ```bash
    terraform init
    ```

2. Create a plan:

    ```bash
    terraform plan -var-file="environments/dev/terraform.tfvars"
    ```

3. Apply the configuration:

    ```bash
    terraform apply -var-file="environments/dev/terraform.tfvars"
    ```

This sequence of commands initializes Terraform, creates an execution plan based on your configuration, and applies that plan to set up your Redis Cloud database instances as defined.

## Contributing

Contributions to this project are welcome. Please ensure to follow the standard Git workflow and submit pull requests for any changes.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
