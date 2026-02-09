resource "aws_instance" "nat_instance" {
  ami           = var.nat_instance_ami_id
  instance_type = "t3.nano"

  subnet_id              = aws_subnet.public_a.id
  vpc_security_group_ids = [
    aws_security_group.nat_sg.id
  ]
  source_dest_check = false

  tags = {
    Name = "seolim-nat-instance"
  }
}