provider "kubernetes" {}

provider "lacework" {}

resource "lacework_agent_access_token" "k8s" {
  name        = "prod"
  description = "k8s deployment for production env"
}

module "lacework_k8s_datacollector" {
  source = "../../"

  lacework_access_token = lacework_agent_access_token.k8s.token

  enable_cluster_agent  = true
  lacework_cluster_name = "My-K8s-Cluster"
  lacework_cluster_type = "eks"
}
