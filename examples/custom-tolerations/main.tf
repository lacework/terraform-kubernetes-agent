provider "kubernetes" {}

module "lacework_k8s_datacollector" {
  source = "../../"

  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"

  tolerations = [
    {
      key      = "test-key",
      operator = "Equal",
      value    = "test-value",
      effect   = "NoSchedule"
    },
    {
      key      = "spotInstance",
      operator = "Exists",
      effect   = "NoSchedule"
    }
  ]
}
