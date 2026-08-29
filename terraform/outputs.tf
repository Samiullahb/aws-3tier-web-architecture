output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "load_balancer_dns" {
  description = "Public ALB DNS name"
  value       = aws_lb.main.dns_name
}

output "database_endpoint" {
  description = "Private RDS endpoint"
  value       = aws_db_instance.main.address
}

output "application_subnet_ids" {
  description = "Private application subnet IDs"
  value       = aws_subnet.app[*].id
}
