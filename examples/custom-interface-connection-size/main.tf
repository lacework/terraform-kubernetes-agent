provider "kubernetes" {}

module "lacework_k8s_datacollector" {
  source = "../../"

  lacework_access_token                    = "0123456789ABCDEF0123456789ABCDEF"
  lacework_agent_interface_connection_size = "60000"
}
