resource "aws_iam_instance_profile" "this" {
  name = "${var.project_name}-${var.env}-profile"
  role = aws_iam_role.this.name
}
resource "aws_iam_role" "this" {
  name = "${var.project_name}-${var.env}-instance-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}
