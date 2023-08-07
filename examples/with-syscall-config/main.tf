provider "kubernetes" {}

provider "lacework" {}

resource "lacework_agent_access_token" "k8s" {
  name        = "prod"
  description = "k8s deployment for production env"
}

module "lacework_k8s_datacollector" {
  source = "../../"

  lacework_access_token                  = lacework_agent_access_token.k8s.token
  lacework_enable_default_syscall_config = true
}
