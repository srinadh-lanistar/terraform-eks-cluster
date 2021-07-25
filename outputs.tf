output "eks-endpoint" {
  value = aws_eks_cluster.eks-cluster.endpoint
}

output "eks-cluster-arn" {
  value = aws_eks_cluster.eks-cluster.arn
}