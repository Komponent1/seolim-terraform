resource "aws_instance" "app" {
  ami           = var.ec2_ami_id
  instance_type = "t3.micro"

  subnet_id              = aws_subnet.private_a.id
  vpc_security_group_ids = [
    aws_security_group.private_ec2_sg.id
  ]

  tags = {
    Name = "seolim-server"
  }
}