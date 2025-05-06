resource "aws_ecs_task_definition" "bia-ecs" {
  family                   = "task-def-bia"
  network_mode             = "bridge"

  container_definitions = jsonencode([
    {
      name         = "bia"
      image        = "${aws_ecr_repository.bia.repository_url}:latest"
      essential    = true
      portMappings = [{ containerPort = 8080, hostPort = 0 }],
      memoryReservation = 400
      cpu          = 1024
      Environment = [ 
        { name = "DB_HOST", value = "${aws_db_instance.bia.address}" },
        { name = "DB_PORT", value = "5432" },
        { name = "DB_SECRET_NAME", value = "${data.aws_secretsmanager_secret.bia_db.name}" },
        { name = "REGION", value = "us-east-2" },
        { name = "DEBUG_SECRET", value = "true" }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group = "aws_cloudwatch_log_group.ecs_bia.name"
          awslogs-region = "us-east-2"
          awslogs-stream-prefix = "bia-"
        }
      }
    
    }
  ])

  runtime_platform {
    cpu_architecture = "X86_64"
    operating_system_family = "LINUX"
  }
}