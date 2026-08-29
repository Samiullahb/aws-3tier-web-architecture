# Operations Runbook

## Request path

`Internet -> ALB -> EC2 -> RDS`

## Troubleshooting

### ALB returns 5xx

- Check target health.
- Verify the application security group allows traffic from the ALB security group.
- Check EC2 instance status and application logs.
- Confirm the target group port matches the application port.

### Application cannot reach RDS

- Confirm the RDS endpoint and port.
- Verify the RDS security group allows PostgreSQL only from the application security group.
- Confirm both tiers have network routes to the required destinations.

### Terraform drift

Run `terraform plan`, identify out-of-band changes, and reconcile them through Terraform rather than repeatedly modifying the AWS console.

## Production checklist

- HTTPS/ACM enabled
- RDS Multi-AZ enabled
- Automated backups configured
- WAF enabled where appropriate
- CloudWatch alarms configured
- Remote encrypted Terraform state configured
- Cost budget and alerts configured
