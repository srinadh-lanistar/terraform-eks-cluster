resource "aws_security_group" "EKS_Cluster_SG" {
  name        = var.SG_Name[0].name
  description = var.SG_Name[0].description
  vpc_id      = var.vpc_id

  dynamic "egress" {
    for_each = var.Egress_list
    content {
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      protocol         = egress.value.protocol
      cidr_blocks      = egress.value.cidr_blocks
      ipv6_cidr_blocks = egress.value.ipv6_cidr_blocks
    }
  }
  tags = {
    terraform = true
  }
}
resource "aws_security_group" "EKS_Nodes_SG" {
  name        = var.SG_Name[1].name
  description = var.SG_Name[1].description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.Ingress_list
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.Egress_list
    content {
      from_port        = egress.value.from_port
      to_port          = egress.value.to_port
      protocol         = egress.value.protocol
      cidr_blocks      = egress.value.cidr_blocks
      ipv6_cidr_blocks = egress.value.ipv6_cidr_blocks
    }
  }

  tags = {
    terraform = true
  }
}
