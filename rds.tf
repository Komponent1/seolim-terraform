resource "aws_db_instance" "mysql" {
  identifier = "free-mysql"

  engine         = "mysql"
  engine_version = "8.4.7"

  instance_class = "db.t3.micro"

  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = "app"
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  publicly_accessible = false
  multi_az            = false

  backup_retention_period = 7

  skip_final_snapshot = true

  deletion_protection = false

  parameter_group_name = aws_db_parameter_group.mysql8.name

  tags = {
    Name = "free-mysql"
  }
}
