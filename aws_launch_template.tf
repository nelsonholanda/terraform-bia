data "aws_ssm_parameter" "ecs_node_ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/recommended/image_id"
}

resource "aws_launch_template" "ecs_ec2" {
  name_prefix   = "cluster-bia-"
  image_id      = data.aws_ssm_parameter.ecs_node_ami.value
  instance_type = "t3.medium"
  iam_instance_profile { arn = aws_iam_instance_profile.ecs_node.arn }
  monitoring { enabled = false }
  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.bia-ec2.id]
  }

  user_data = base64encode(<<-EOF
    #!/bin/bash
    echo ECS_CLUSTER=${aws_ecs_cluster.cluster-bia.name} >> /etc/ecs/ecs.config
    EOF
  )
}