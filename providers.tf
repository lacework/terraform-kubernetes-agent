provider "kubernetes" {}

########### Example AWS EKS Config ###########
# data "aws_eks_cluster_auth" "eks_cluster" {
#   name = "EKS CLUSTER NAME"
# }
# 
# provider "kubernetes" {
#   host                   = aws_eks_cluster.eks_cluster.endpoint
#   cluster_ca_certificate = base64decode(aws_eks_cluster.eks_cluster.certificate_authority[0].data)
#   token                  = data.aws_eks_cluster_auth.eks_cluster.token
#   load_config_file       = false
# }
