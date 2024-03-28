
# Terraform Infrastructure Deployment Workflow

This repository contains Terraform configuration files for provisioning and managing the infrastructure required to deploy the web application. A CI/CD workflow has been implemented to automate the Terraform deployment process. This workflow is triggered by the completion of the web application deployment workflow.

## Project Structure


    terraform/
    ├── backend.tf               # Backend configuration for storing Terraform state
    ├── .github/
    │   └── workflows/
    │       └── main.yml         # CI/CD workflow definition file
    ├── main.tf                  # Main Terraform configuration file
    └── variables.tf             # Terraform variables definition file 

## Workflow Overview

The CI/CD workflow defined in `.github/workflows/main.yml` automates the Terraform deployment process. This workflow is triggered upon the successful completion of the web application deployment workflow.

Here's a breakdown of the workflow steps:

1.  **Checkout Code**: Checks out the latest version of the Terraform configuration files.
    
2.  **Authentication**: Authenticates with Google Cloud Platform using service account credentials stored securely in GitHub Secrets.
    
3.  **Install tfsec**: Installs `tfsec`, a tool for static analysis of Terraform configurations, to ensure best practices and security compliance.
    
4.  **Set up Terraform**: Sets up Terraform with the specified version and environment variables required for authentication.
    
5.  **Terraform Init**: Initializes Terraform and configures the backend to store the Terraform state in a Google Cloud Storage bucket specific to the environment.
    
6.  **Run tfsec**: Runs `tfsec` to analyze the Terraform configurations for security issues. This step ensures that the infrastructure is provisioned securely.
    
7.  **Terraform Plan**: Generates an execution plan for Terraform to preview the changes that will be applied to the infrastructure.
    
8.  **Terraform Apply**: Applies the Terraform execution plan to provision or update the infrastructure. This step automatically approves the changes and applies them to the environment.
    

## Trigger

This workflow is triggered by the completion of the web application deployment workflow. Upon successful deployment of the web application, this Terraform deployment workflow is automatically initiated to ensure that the infrastructure is updated accordingly.

## Additional Notes

-   This workflow follows CI/CD and DevOps best practices by automating the infrastructure provisioning process, ensuring consistency, reliability, and repeatability of deployments.
-   Infrastructure changes are managed using Terraform, allowing for infrastructure as code (IaC) practices, version control, and reproducibility.
-   Security compliance is enforced using `tfsec` to analyze Terraform configurations for potential security vulnerabilities and misconfigurations.
-   Secrets such as GCP service account credentials are securely stored in GitHub Secrets and accessed only during the workflow execution.
