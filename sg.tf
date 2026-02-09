resource "aws_security_group" "alb_sg" {
  name        = "seolim-public-alb"
  description = "alb"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "seolim-public-alb"
  }
}

resource "aws_security_group" "private_ec2_sg" {
  name        = "seolim-seurity-group-priavte-ec2"
  description = "ec2"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    security_groups = [
      aws_security_group.alb_sg.id
    ]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "seolim-seurity-group-priavte-ec2"
  }
}

resource "aws_security_group" "public_sg" {
  name        = "seolim-public-security-group"
  description = "seolim-public-subnet-security-group"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      var.control_cidr
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "seolim-public-security-group"
  }
}

resource "aws_security_group" "rds_sg" {
  name        = "rds-mysql-sg"
  description = "mysql access from private ec2"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [
      aws_security_group.private_ec2_sg.id
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-mysql-sg"
  }
}

resource "aws_security_group" "nat_sg" {
  name        = "nat-instance-sg"
  description = "Security group for NAT instance"
  vpc_id      = aws_vpc.main.id

  # NAT Instance가 Internet과 통신할 수 있도록 outbound는 전부 허용
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nat-instance-sg"
  }
}
