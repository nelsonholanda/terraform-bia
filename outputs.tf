output instance_id {
  description = "ID da instância EC2"
  value       = aws_instance.bia-dev.id
}
output instance_type    {
  description = "Tipo da instância EC2"
  value       = aws_instance.bia-dev.instance_type
}
output instance_public_ip {
  description = "IP público da instância EC2"
  value       = aws_instance.bia-dev.public_ip
}

output instance_private_ip {
  description = "IP privado da instância EC2"
  value       = aws_instance.bia-dev.private_ip
}

output aws_security_group_id {
  description = "ID do grupo de segurança"
  value       = aws_security_group.bia_dev.id
}
output aws_security_group_name {
  description = "Nome do grupo de segurança"
  value       = aws_security_group.bia_dev.name
}

output rds_endpoint {
  description = "Endpoint do banco de dados RDS"
  value       = aws_db_instance.bia.endpoint
}

output "instance_type_rds" {
  description = "Tipo da instância RDS BIA"
  value       = aws_db_instance.bia.instance_class
}

output rds_secrets {
  description = "Secrets do banco de dados RDS BIA" 
  value=tolist(aws_db_instance.bia.master_user_secret)[0].secret_arn
}

output bia_repo_url {
  description = "URL do repositório BIA"
  value = aws_ecr_repository.bia.repository_url
}

output "rds_secret_name" {
  description = "Nome do segredo do banco de dados RDS BIA"
  value       = data.aws_secretsmanager_secret.bia_db.name
}

output "alb_url" {
  description = "URL do load balancer"
  value       = aws_lb.bia.dns_name
}