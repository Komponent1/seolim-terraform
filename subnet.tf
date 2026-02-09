resource "aws_subnet" "private_c" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "ap-northeast-2c"

  tags = {
    Name = "seolim-private-subnet-2"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-northeast-2a"

  tags = {
    Name = "seolim-private-subnet-1"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-2c"

  map_public_ip_on_launch = true

  tags = {
    Name = "seolim-public-subnet-2"
  }
}

resource "aws_subnet" "public_a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-2a"

  map_public_ip_on_launch = true

  tags = {
    Name = "seolim-public-subnet-1"
  }
}
