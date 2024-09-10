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
