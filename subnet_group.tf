resource "aws_db_subnet_group" "main" {
  name        = "rds-subnet-group"
  description = "private subnets for rds"

  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_c.id
  ]

  tags = {
    Name = "rds-subnet-group"
  }
}
