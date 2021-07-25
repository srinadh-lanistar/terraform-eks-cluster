data "aws_subnet_ids" "subnet_ids" {
  vpc_id = var.vpc_id
  filter {
    name   = "tag:Name"
    values = ["*Private Test*"] # insert values here
  }
}
data "aws_vpc" "myvpc" {
  id = var.vpc_id
}