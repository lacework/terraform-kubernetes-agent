# Release Notes
Another day, another release. These are the release notes for the version `v2.2.0`.

## Features
* feat: added security context placeholder (Alan Nix)([edc00b6](https://github.com/lacework/terraform-kubernetes-agent/commit/edc00b6734ea41d4dddcdd50e09b24f4bb14f97c))
* feat: added resource requests/limits placeholders (Alan Nix)([916868b](https://github.com/lacework/terraform-kubernetes-agent/commit/916868bf8ae890dd157aef18f07f8e11ee51e52a))
* feat: added option for k8s collector deployment (Alan Nix)([04fa746](https://github.com/lacework/terraform-kubernetes-agent/commit/04fa746e3d80e553fd194c07d7e2c0676b9a057c))
## Refactor
* refactor: split main.tf into cluster/node scoped files (Alan Nix)([b7540ee](https://github.com/lacework/terraform-kubernetes-agent/commit/b7540ee1426a1556c2daefca676f0a029aa0fe8a))
## Bug Fixes
* fix: lacework_agent_configuration type (#63) (jonathan stewart)([9d9fde7](https://github.com/lacework/terraform-kubernetes-agent/commit/9d9fde796da1902eab86d9e4aba49eced8150a1b))
## Documentation Updates
* docs: updated example to include `lacework_cluster_region` (Alan Nix)([190bbc4](https://github.com/lacework/terraform-kubernetes-agent/commit/190bbc49344821d36e72d6c9b770076a3ebf956b))
* docs: updated README with new variables (Alan Nix)([b9ac65f](https://github.com/lacework/terraform-kubernetes-agent/commit/b9ac65fd8918bf4bb7b1f6b99335208bbad2b46a))
* docs: update README.md (#56) (Steve)([aae7adb](https://github.com/lacework/terraform-kubernetes-agent/commit/aae7adb72c42f6bff223690379a08f1f8395055b))
## Other Changes
* chore: updated `run_as_user` to match helm deployment (Alan Nix)([e3b14b3](https://github.com/lacework/terraform-kubernetes-agent/commit/e3b14b31d18bcc548df36136943621dcc981e996))
* ci: version bump to v2.1.1-dev (Lacework)([9085fbf](https://github.com/lacework/terraform-kubernetes-agent/commit/9085fbf2041b99bcfd6d2e04921ccc2500976e48))
