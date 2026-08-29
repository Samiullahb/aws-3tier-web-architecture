# Architecture Notes

## Traffic flow

1. A user reaches the public Application Load Balancer.
2. The ALB forwards HTTP traffic to healthy EC2 instances in private application subnets.
3. EC2 instances can reach external services through the NAT Gateway when required.
4. Application instances reach PostgreSQL on RDS over TCP/5432.
5. RDS is placed in dedicated private database subnets and is not publicly accessible.

## Security boundaries

| Tier | Exposure | Allowed inbound |
| --- | --- | --- |
| ALB | Public | TCP/80 from internet |
| App | Private | TCP/80 from ALB security group |
| DB | Private | TCP/5432 from App security group |

## Availability

The public and application/database subnets span two Availability Zones. The Auto Scaling Group maintains two application instances by default.

## Important production improvements

- Use HTTPS with an ACM certificate.
- Add AWS WAF to the ALB.
- Deploy NAT Gateways per Availability Zone when availability requirements justify the cost.
- Enable RDS Multi-AZ for production.
- Configure automated backups and a retention policy.
- Store Terraform state remotely with encryption and locking.
- Add CloudWatch alarms and centralized logs.
