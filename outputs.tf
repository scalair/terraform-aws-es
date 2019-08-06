##################
# Security group #
##################
output "aws_security_group_id" {
  value = aws_security_group.es.id
}
output "aws_security_group_arn" {
  value = aws_security_group.es.arn
}
output "aws_security_group_vpc_id" {
  value = aws_security_group.es.vpc_id
}
output "aws_security_group_owner_id" {
  value = aws_security_group.es.owner_id
}
output "aws_security_group_name" {
  value = aws_security_group.es.name
}
output "aws_security_group_description" {
  value = aws_security_group.es.description
}
output "aws_security_group_ingress" {
  value = aws_security_group.es.ingress
}
output "aws_security_group_egress" {
  value = aws_security_group.es.egress
}

########################
# Elasticsearch Domain #
########################
output "aws_elasticsearch_domain_arn" {
  description = "Amazon Resource Name (ARN) of the domain."
  value       = aws_elasticsearch_domain.es.arn
}
output "aws_elasticsearch_domain_domain_id" {
  description = "Unique identifier for the domain."
  value       = aws_elasticsearch_domain.es.domain_id
}
output "aws_elasticsearch_domain_domain_name" {
  description = "The name of the Elasticsearch domain."
  value       = aws_elasticsearch_domain.es.domain_name
}
output "aws_elasticsearch_domain_endpoint" {
  description = "Domain-specific endpoint used to submit index, search, and data upload requests."
  value       = aws_elasticsearch_domain.es.endpoint
}
output "aws_elasticsearch_domain_kibana_endpoint" {
  description = "Domain-specific endpoint for kibana without https scheme."
  value       = aws_elasticsearch_domain.es.kibana_endpoint
}
output "aws_elasticsearch_domain_vpc_options_availability_zones" {
  description = "If the domain was created inside a VPC, the names of the availability zones the configured subnet_ids were created inside."
  value       = aws_elasticsearch_domain.es.vpc_options.0.availability_zones
}
output "aws_elasticsearch_domain_vpc_options_vpc_id" {
  description = "If the domain was created inside a VPC, the ID of the VPC."
  value       = aws_elasticsearch_domain.es.vpc_options.0.vpc_id
}