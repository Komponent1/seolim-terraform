resource "aws_db_parameter_group" "mysql8" {
  name        = "mysql8-free-parameter-group"
  family      = "mysql8.4"
  description = "MySQL 8.0 free tier parameter group"

  # Timezone
  parameter {
    name  = "time_zone"
    value = "Asia/Seoul"
  }

  # Charset
  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }

  parameter {
    name  = "collation_server"
    value = "utf8mb4_unicode_ci"
  }

  # SQL Mode (MySQL 8 기본 + 안정성)
  parameter {
    name  = "sql_mode"
    value = "STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION"
  }

  # Free Tier 보호용
  parameter {
    name  = "max_connections"
    value = "50"
  }

  tags = {
    Name = "mysql8-free-parameter-group"
  }
}
