# AWS 3-Tier Web Architecture

A production-style three-tier web application architecture on AWS, provisioned with Terraform.

## Architecture

```text
                    Internet
                       |
                 [Application LB]
                       |
             +---------+---------+
             |                   |
        Public Subnet       Public Subnet
             |                   |
        ALB / NAT           ALB / NAT
             |                   |
             +---------+---------+
                       |
                Private App Tier
                 EC2 / Auto Scaling
                       |
                Private DB Tier
                    Amazon RDS
```

## Tiers

### Presentation tier
- Application Load Balancer
- Public subnets in multiple Availability Zones
- HTTP entry point for the application

### Application tier
- EC2 instances in private subnets
- Auto Scaling Group
- IAM instance profile
- Security group accepts application traffic only from the ALB

### Database tier
- Amazon RDS in private database subnets
- No direct internet exposure
- Database security group accepts traffic only from the application tier

## Security Design

- Database is isolated from the public internet
- Application servers are not directly exposed
- Security groups enforce tier-to-tier access
- IAM roles are preferred over static AWS credentials
- Private subnets use controlled outbound connectivity

## Repository Structure

```text
.
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── versions.tf
│   └── terraform.tfvars.example
├── docs/
│   └── architecture.md
├── .github/workflows/
│   └── terraform.yml
├── .gitignore
└── README.md
```

## Deployment

Requirements:

- Terraform >= 1.6
- AWS CLI
- AWS account
- AWS credentials configured locally

```bash
cd terraform
terraform init
terraform fmt -check -recursive
terraform validate
terraform plan
terraform apply
```

Do not commit credentials, `.tfstate` files, private keys, or real secret values.

## Production Hardening

For a real production workload, consider HTTPS with ACM, AWS WAF, encrypted RDS storage, automated backups, Multi-AZ database deployment, centralized logging, alarms, remote Terraform state, CI/CD approval gates, and cost controls.

## Technologies

AWS · Terraform · VPC · ALB · EC2 · Auto Scaling · RDS · IAM · CloudWatch · Infrastructure as Code

## Portfolio Goal

This project demonstrates practical cloud-engineering skills in network segmentation, high availability, security boundaries, compute scaling, managed databases, and Infrastructure as Code.
