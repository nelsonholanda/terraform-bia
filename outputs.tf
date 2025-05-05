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
