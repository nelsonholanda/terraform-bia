resource "aws_lb" "bia" {
  name               = "bia-alb"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.bia-alb.id]
  subnets            = [local.subnet_zona_a_public, local.subnet_zona_b_public, local.subnet_zona_c_public]
}

resource "aws_lb_target_group" "tg-bia" {
  name     = "bia-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = local.vpc_id
  target_type = "instance"
  deregistration_delay = 30
  
  health_check {
    enabled             = true
    interval            = 10
    path                = "/api/versao"
    port                = "traffic-port"
    matcher             = 200
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}
  resource "aws_lb_listener" "bia" {
  load_balancer_arn = aws_lb.bia.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-bia.id
    }
}

