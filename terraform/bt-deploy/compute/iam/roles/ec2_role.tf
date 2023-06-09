resource "aws_iam_role" "ec2_instance" {

  name               = var.ec2_instance_role
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {
      "Service": "ec2.amazonaws.com"
    },
    "Action": "sts:AssumeRole"
  }
}
EOF

  force_detach_policies = true
  tags                  = merge(var.tags, { Name = "${var.ec2_instance_role}-role" })
}

resource "aws_iam_role_policy_attachment" "ec2_instance_policy_attachment" {
  role       = aws_iam_role.ec2_instance.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "ec2_instance" {
  name = aws_iam_role.ec2_instance.name
  role = aws_iam_role.ec2_instance.name
}

output "ec2_instance" {
  value = aws_iam_instance_profile.ec2_instance.arn
}