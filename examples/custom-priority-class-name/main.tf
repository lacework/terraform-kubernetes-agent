provider "kubernetes" {}

provider "lacework" {}

resource "kubernetes_priority_class" "example" {
  metadata {
    name = "terraform-example"
  }

  value = 100
}

resource "lacework_agent_access_token" "k8s" {
  name        = "prod"
  description = "k8s deployment for production env"
}

module "lacework_k8s_datacollector" {
  source = "../../"

  lacework_access_token   = lacework_agent_access_token.k8s.token
  pod_priority_class_name = kubernetes_priority_class.example.metadata[0].name
}
