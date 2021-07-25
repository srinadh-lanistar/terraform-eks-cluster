variable "vpc_id" {
  type      = string
  default   = "vpc-0c270506c25b85b0f"
  sensitive = true
}

variable "instance_type" {
  type    = string
  default = "kafka.t3.small"
}
variable "eks_cluster_name" {
  type    = string
  default = "EKS-Demo-Cluster"
}
variable "SG_Name" {
  type = list(any)
  default = [
    {
      name        = "EKS_Demo_Cluster_SG"
      description = "Security Group of EKS Demo Cluster"
    },
    {
      name        = "EKS_Node_SG"
      description = "Security Group of EKS Node"
  }]
}
variable "Ingress_list" {
  type = list(any)
  default = [
    {
      description = "Allow All traffic from VPC"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["10.150.0.0/22"]
    }
  ]
}
variable "Egress_list" {
  type = list(any)
  default = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  ]
}
# locals {
#   tags_list = {
#     Name             = var.SG_Name.name
#     terraform        = true
#     MSK_Cluster_Name = var.cluster_name
#   }
# }
# locals {
#   cloudwatch_log_group_name = "awsmsk/${var.cluster_name}"
# }
variable "eks_node_role_name" {
  default = "eks_node_role"
}
variable "node_group_name" {
  default = "simple_node_group"
}