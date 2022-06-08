# Kubernetes Deployment w/ Priority Class Name

This example shows how to set the priority class name.

```hcl
provider "kubernetes" {}

resource "kubernetes_priority_class" "example" {
  metadata {
    name = "terraform-example"
  }

  value = 100
}

module "lacework_k8s_datacollector" {
  source  = "lacework/agent/kubernetes"
  version = "~> 1.0"

  lacework_access_token = "0123456789ABCDEF0123456789ABCDEF"
  lacework_proxy_url    = "https://proxy.address.here:8080"
  priority_class_name   = kubernetes_priority_class.example.metadata[0].name

}
```
