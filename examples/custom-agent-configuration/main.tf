provider "kubernetes" {}

module "lacework_k8s_datacollector" {
  source = "../../"

  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"
  lacework_agent_configuration = {
    "privileges" : {
      "capsmode" : "enabled"
    }
    "fim" : {
      "runat": "23:50"
      "mode": "enable"
    }
    "cpurequest": "200m"
  }
}
