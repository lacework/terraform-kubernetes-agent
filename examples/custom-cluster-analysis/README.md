# Kubernetes Deployment w/ Cluster Compliance Analysis

This example shows how to use the Terraform Provider for Lacework to create
a new Lacework Agent Token and use it to generate a Kubernetes DaemonSet and
Secret configuration for deploying the Lacework Datacollector Agent. This
example also enables Kubernetes Compliance analysis for the deployment.

```hcl
provider "kubernetes" {}

provider "lacework" {}

data "aws_region" "current" {}

resource "lacework_agent_access_token" "k8s" {
  name        = "prod"
  description = "k8s deployment for production env"
}

module "lacework_k8s_datacollector" {
  source  = "lacework/agent/kubernetes"
  version = "~> 2.0"

  lacework_access_token = lacework_agent_access_token.k8s.token

  enable_cluster_agent    = true
  lacework_cluster_name   = "My-K8s-Cluster"
  lacework_cluster_region = data.aws_region.current.name
  lacework_cluster_type   = "eks"
}
```
