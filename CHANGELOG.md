# v2.2.0

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
---
# v2.1.0

## Features
* feat: add support for node_selector (#53) (Steve)([c92dbd0](https://github.com/lacework/terraform-kubernetes-agent/commit/c92dbd01ddc91622dc6ba8a054f69ca1f98f193e))
## Other Changes
* ci: version bump to v2.0.1-dev (Lacework)([dd336e3](https://github.com/lacework/terraform-kubernetes-agent/commit/dd336e33f9870d3b4862e438a7737344f8838cae))
---
# v2.0.0

## Features
* feat: added support for `priorityClassName` definition (Alan Nix)([dc0b1cc](https://github.com/lacework/terraform-kubernetes-agent/commit/dc0b1cc4162b235d103d64c5ab0f34244a52b303))
* feat: allow modification of all agent configuration parameters (Alan Nix)([efefb37](https://github.com/lacework/terraform-kubernetes-agent/commit/efefb375118282c1598b07fa2f5dd2c5285d8b54))
* feat: expose priority_class_name argument (#50) (Darren)([a4e626d](https://github.com/lacework/terraform-kubernetes-agent/commit/a4e626d579ba0f7dc608e851635d361e6cc61e1e))
* feat: deprecate support for Terraform 0.12 and 0.13 (#48) (Darren)([11c99c2](https://github.com/lacework/terraform-kubernetes-agent/commit/11c99c26355ea9043484be79f5b19251efbfe3a0))
## Bug Fixes
* fix: resolved priority class name merge collision (Alan Nix)([9dfb560](https://github.com/lacework/terraform-kubernetes-agent/commit/9dfb560bb2c0bf92398023708c55ef0e8d3bedd0))
## Other Changes
* ci: version bump to v1.5.2-dev (Lacework)([a8da513](https://github.com/lacework/terraform-kubernetes-agent/commit/a8da513313ad828ca906b213006f8e1b9e823e15))
---
# v1.5.1

## Documentation Updates
* docs: Update README to match resource defaults (#44) (Chris Golden)([ff8e4b7](https://github.com/lacework/terraform-kubernetes-agent/commit/ff8e4b7ff72cd9cedeb31390e61050b0c8776369))

## Other Changes
* chore: update PR template (#42) (Darren)([5986190](https://github.com/lacework/terraform-kubernetes-agent/commit/59861902c3f3343e06e3e7bc015c7dea826b2e03))
* ci: version bump to v1.5.1-dev (Lacework)([a27ea66](https://github.com/lacework/terraform-kubernetes-agent/commit/a27ea66579bf3a64dacfdf603576d163cd666768))
---
# v1.5.0

## Features
* feat: add autoupgrade flag and enable stdout logging (#40) (Chris Golden)([2fa80eb](https://github.com/lacework/terraform-kubernetes-agent/commit/2fa80eb56a61ccd57c3f5d902a7c1a15b803f525))
## Other Changes
* ci: version bump to v1.4.3-dev (Lacework)([c60cdfa](https://github.com/lacework/terraform-kubernetes-agent/commit/c60cdfa0e5c1edcda4447864bd51e286afa37d20))
---
# v1.4.2

## Refactor
* refactor: match resource requests/limits with Helm (#38) (Chris Golden)([04a4295](https://github.com/lacework/terraform-kubernetes-agent/commit/04a4295c9bc79999a453aa3852f9486c56fb8b35))
## Other Changes
* ci: version bump to v1.4.2-dev (Lacework)([7ac5201](https://github.com/lacework/terraform-kubernetes-agent/commit/7ac5201b72c8133e99e610c93139395d9164bf92))
---
# v1.4.1

## Bug Fixes
* fix: improved support for various tolerations (Alan Nix)([85bcc18](https://github.com/lacework/terraform-kubernetes-agent/commit/85bcc180a3e8e4f3a275b2da0430adb07e5cd32e))
## Documentation Updates
* docs: Add contributing documentation (#35) (Darren)([30fd5e8](https://github.com/lacework/terraform-kubernetes-agent/commit/30fd5e8adb3d39cdaafefb440324cdf85f5c66be))
## Other Changes
* ci: version bump to v1.4.1-dev (Lacework)([0ae3dd6](https://github.com/lacework/terraform-kubernetes-agent/commit/0ae3dd61f6aa3166963db3b1af7bb05c2c610f7b))
---
# v1.4.0

## Features
* feat: Expose revision_history_limit attribute (#33) (Jay R)([45fab38](https://github.com/lacework/terraform-kubernetes-agent/commit/45fab38dd61a434461c0402547bfc8f3679a1e1f))
## Other Changes
* ci: version bump to v1.3.1-dev (Lacework)([eb8a561](https://github.com/lacework/terraform-kubernetes-agent/commit/eb8a561c43b34c85103fc5ff34735ddd393e6b51))
---
# v1.3.0

## Features
* feat: added the ability to customize the agent proxy URL (Alan Nix)([940da0a](https://github.com/lacework/terraform-kubernetes-agent/commit/940da0a3e689456a59064e58d40e4ce9176fdb18))
## Other Changes
* chore: version bump to v1.2.1-dev (Lacework)([90c23e5](https://github.com/lacework/terraform-kubernetes-agent/commit/90c23e59824a2e4e23754a4b7feadc48a5f5b652))
* ci: update releng email (#30) (Salim Afiune)([8a580c0](https://github.com/lacework/terraform-kubernetes-agent/commit/8a580c0c6d52a01db7a9f19705709b36e29da940))
* ci: sign lacework-releng commits (#26) (Salim Afiune)([0d20218](https://github.com/lacework/terraform-kubernetes-agent/commit/0d20218e0e579479837461de4db6355619e38093))
---
# v1.2.0

## Features
* feat: add label to deamonset metadata (#24) (zdannar)([1e46db1](https://github.com/lacework/terraform-kubernetes-agent/commit/1e46db197fbc38161ee3c4a0624da45dcf2c4ac1))
## Documentation Updates
* docs: update all examples/ (#21) (Salim Afiune)([a0669a0](https://github.com/lacework/terraform-kubernetes-agent/commit/a0669a0820808aefe25f1e9133d460af0724e07f))
## Other Changes
* chore: version bump to v1.1.1-dev (Lacework)([d32f417](https://github.com/lacework/terraform-kubernetes-agent/commit/d32f417546a1a5e1d696fbe0d5fa9eeae074287b))
---
# v1.1.0

## Features
* feat: added ability to change Lacework server URL (Alan Nix)([464e93d](https://github.com/lacework/terraform-kubernetes-agent/commit/464e93d36a1c85b2e4e9b7e67b263e1ec21aeb84))
## Bug Fixes
* fix: 'InterfaceConnectionSize' implemented incorrectly in config.json (Alan Nix)([deab277](https://github.com/lacework/terraform-kubernetes-agent/commit/deab27767c22483d8564d7d2689f912cb68f81be))
## Documentation Updates
* docs: updated module version pinning (Alan Nix)([f507cd9](https://github.com/lacework/terraform-kubernetes-agent/commit/f507cd9f0007731e3120ab681b7b2a1f979fab4f))
## Other Changes
* chore: cleaned up .gitignore to ignore Terraform lock files (Alan Nix)([60f1aa5](https://github.com/lacework/terraform-kubernetes-agent/commit/60f1aa5ad91fd7ed4f44b482fa061bc1e269e782))
* chore: version bump to v1.0.2-dev (Lacework)([dd56428](https://github.com/lacework/terraform-kubernetes-agent/commit/dd56428a138eb2d2657acc78f1e6347598c50d6f))
---
# v1.0.1

## Other Changes
* chore: bump required version of TF to 0.12.31 (#17) (Scott Ford)([fb57d68](https://github.com/lacework/terraform-kubernetes-agent/commit/fb57d6847f7ac016df3fb787d14b366fbd2631c3))
* chore: version bump to v1.0.1-dev (Lacework)([9274990](https://github.com/lacework/terraform-kubernetes-agent/commit/9274990370ccfdf3a6efcfc9e642e24478ff5b05))
---
# v1.0.0

## Documentation Updates
* docs: improved example documentation (#13) (Alan Nix)([a8bdc0d](https://github.com/lacework/terraform-kubernetes-agent/commit/a8bdc0de781173d0514fd8581bd5126216e4d1a3))
## Other Changes
* build(deps): migrate kubernetes provider to >= 2.0.0 (#9) (Samuel Bégin)([b15ff07](https://github.com/lacework/terraform-kubernetes-agent/commit/b15ff07f69d800b99da138c674d46e625694e261))
* ci: fix finding major versions during release (#15) (Salim Afiune)([2799fd5](https://github.com/lacework/terraform-kubernetes-agent/commit/2799fd50ddfa00948a667547c1b7435255f82514))
* ci: switch PR test from CircleCI to CodeFresh (#14) (Darren)([4a96100](https://github.com/lacework/terraform-kubernetes-agent/commit/4a96100ba610b90104a2b8e4afba5b8637ce25a2))
---
# v0.3.0

## Features
* feat: Support setting ServiceAccount in Pod template (#8) (John Marion)([0b325d5](https://github.com/lacework/terraform-kubernetes-agent/commit/0b325d5457512358b65998ba54a90e65a3ed67d6))
## Other Changes
* ci: open release pull request automatically (Salim Afiune Maya)([da085b2](https://github.com/lacework/terraform-kubernetes-agent/commit/da085b219c953d6870d2eb2efeca7acc99c7456d))
* ci: automatic minor version bump (Salim Afiune Maya)([a8cc0be](https://github.com/lacework/terraform-kubernetes-agent/commit/a8cc0be9af7a9505af9af260ed15b0ee3b0055e1))
* ci: switch releases to be own by Lacework releng ⚡ (#7) (Salim Afiune)([65df0df](https://github.com/lacework/terraform-kubernetes-agent/commit/65df0df0907019e7ad57dfcd540a245bb7c08a5a))
---
# v0.2.0

## Features
* feat(config): Add lacework_agent_interface_connection_size variable (#5) (Jean-Philippe Lachance)([fa259c2](https://github.com/lacework/terraform-kubernetes-agent/commit/fa259c204c41161f1ef47753ffd2fa09147a15a3))
---
# v0.1.0

Initial commit
