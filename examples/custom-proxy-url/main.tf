provider "kubernetes" {}

module "lacework_k8s_datacollector" {
  source = "../../"

  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"
  lacework_proxy_url   = "https://proxy.address.here:8080"
}
