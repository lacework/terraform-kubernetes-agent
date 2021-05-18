<a href="https://lacework.com"><img src="https://techally-content.s3-us-west-1.amazonaws.com/public-content/lacework_logo_full.png" width="600"></a>

# terraform-kubernetes-agent

[![GitHub release](https://img.shields.io/github/release/lacework/terraform-kubernetes-agent.svg)](https://github.com/lacework/terraform-kubernetes-agent/releases/)
[![Codefresh build status](https://g.codefresh.io/api/badges/pipeline/lacework/terraform-modules%2Ftest-compatibility?type=cf-1&key=eyJhbGciOiJIUzI1NiJ9.NWVmNTAxOGU4Y2FjOGQzYTkxYjg3ZDEx.RJ3DEzWmBXrJX7m38iExJ_ntGv4_Ip8VTa-an8gBwBo)](https://g.codefresh.io/pipelines/edit/new/builds?id=607e25e6728f5a6fba30431b&pipeline=test-compatibility&projects=terraform-modules&projectId=607db54b728f5a5f8930405d)

A Terraform Module to create a Secret and DaemonSet for deploying the Lacework Datacollector Agent in a Kubernetes cluster.

## Kubernetes

The `main.tf` file will configure a Kubernetes Secret and DaemonSet which will then be used to run the Lacework Datacollector pod across all worker nodes in a cluster.

## Requirements

| Name       | Version    |
| ---------- | ---------- |
| terraform  | >= 0.12.31 |
| kubernetes | >= 2.0.0   |

## Providers

| Name       | Version  |
| ---------- | -------- |
| kubernetes | >= 2.0.0 |
| random     | n/a      |

## Resources

| Name                                                                                                                                        | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [kubernetes_daemonset.lacework_datacollector](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/daemonset) | resource |
| [kubernetes_secret.lacework_config](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret)              | resource |
| [random_id.config_name_tail](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id)                             | resource |

## Inputs

| Name                                     | Description                                                            | Type                | Default                                                                                               | Required |
| ---------------------------------------- | ---------------------------------------------------------------------- | ------------------- | ----------------------------------------------------------------------------------------------------- | :------: |
| lacework_access_token                    | The access token for the Lacework agent                                | `string`            | n/a                                                                                                   |   yes    |
| lacework_agent_interface_connection_size | Desired value for the InterfaceConnectionSize Lacework agent parameter | `string`            | `""`                                                                                                  |    no    |
| lacework_agent_name                      | The name for the Lacework agent service within Kubernetes              | `string`            | `"lacework-agent"`                                                                                    |    no    |
| lacework_agent_tags                      | A map/dictionary of Tags to be assigned to the Lacework datacollector  | `map(string)`       | `{}`                                                                                                  |    no    |
| lacework_config_name                     | The name for the Lacework agent configuration within Kubernetes        | `string`            | `"lacework-config"`                                                                                   |    no    |
| lacework_image                           | The name of the image to use for deploying the Lacework datacollector  | `string`            | `"lacework/datacollector"`                                                                            |    no    |
| lacework_image_pull_policy               | The pull policy to use for deploying the Lacework datacollector        | `string`            | `"Always"`                                                                                            |    no    |
| lacework_server_url                      | The server URL for the Lacework agent                                  | `string`            | `""`                                                                                                  |    no    |
| namespace                                | The Kubernetes namespace in which to deploy                            | `string`            | `"default"`                                                                                           |    no    |
| pod_cpu_limit                            | The limit of CPU units for the Lacework datacollector pod              | `string`            | `"1"`                                                                                                 |    no    |
| pod_cpu_request                          | The amount of CPU units to request for the Lacework datacollector pod  | `string`            | `"100m"`                                                                                              |    no    |
| pod_mem_limit                            | The limit of Memory for the Lacework datacollector pod                 | `string`            | `"1024Mi"`                                                                                            |    no    |
| pod_mem_request                          | The amount of Memory to request for the Lacework datacollector pod     | `string`            | `"512Mi"`                                                                                             |    no    |
| pod_service_account                      | The Kubernetes ServiceAccount to use in the pod template               | `string`            | `""`                                                                                                  |    no    |
| tolerations                              | A list of Kubernetes Tolerations to apply to the DaemonSet definition  | `list(map(string))` | <pre>[<br> {<br> "effect": "NoSchedule",<br> "key": "node-role.kubernetes.io/master"<br> }<br>]</pre> |    no    |

## Outputs

| Name                           | Description                                                        |
| ------------------------------ | ------------------------------------------------------------------ |
| lacework_config_name           | Name of the Kubernetes Secret containing the Lacework config       |
| lacework_config_version        | Version of the Kubernetes Secret containing the Lacework config    |
| lacework_datacollector_name    | Name of the Kubernetes DaemonSet for the Lacework datacollector    |
| lacework_datacollector_version | Version of the Kubernetes DaemonSet for the Lacework datacollector |
