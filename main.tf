resource "aws_eks_cluster" "eks-cluster" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks-role.arn

  vpc_config {
    subnet_ids         = data.aws_subnet_ids.subnet_ids.ids
    security_group_ids = [aws_security_group.EKS_Cluster_SG.id]
  }
  enabled_cluster_log_types = ["api", "audit"]


  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks-role-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-role-AmazonEKSVPCResourceController,
  ]
  tags = {
    terraform = true
  }
}

