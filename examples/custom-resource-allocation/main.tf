provider "kubernetes" {}

module "lacework_k8s_datacollector" {
  source = "../../"

  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"

  pod_cpu_request = "200m"
  pod_mem_request = "512Mi"
  pod_cpu_limit   = "1"
  pod_mem_limit   = "1024Mi"
}
