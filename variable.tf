variable "ec2_ami_id" {
  type = string
}
variable "db_password" {
  type = string
}
variable "db_username" {
  type = string
}
variable "enable_https" {
  type    = bool
  default = false
}
variable "nat_instance_ami_id" {
  type = string
}
variable "control_cidr" {
  type = string
}