
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "bia-dev" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = "t3.medium"
    iam_instance_profile = aws_iam_instance_profile.role_acesso_ssm.name
    user_data = "${file("userdata.sh")}"
    subnet_id = local.subnet_zona_c_public
    associate_public_ip_address = true
    tags = {
        ambiente = "dev"
        Name = var.instance_name
    } 
    vpc_security_group_ids = [aws_security_group.bia_dev.id]
    root_block_device {
        volume_size = 15
    }
}