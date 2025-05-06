data "aws_iam_policy_document" "ecs_task_role" {
  statement {
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_task_role" {
  name               = "bia-ecs-task-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_task_role.json
}

data "aws_iam_policy_document" "get_secret_bia_db" {
  statement {
    actions   = ["secretsmanager:GetSecretValue"]
    resources = [tolist(aws_db_instance.bia.master_user_secret)[0].secret_arn]
  }
}

resource "aws_iam_policy" "get_secret_bia_db" {
  name   = "get-secret-bia-db"
  policy = data.aws_iam_policy_document.get_secret_bia_db.json
}

resource "aws_iam_role_policy_attachment" "ecs_task_role_policy" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = aws_iam_policy.get_secret_bia_db.arn
}
