### Initial Setup:

Setup of OpenSUSE Micro OS on Hetzner Snapshot used for Kubernetes deployment

requirements

```
:#!/bin/bash
brew tap hashicorp/tapbrew install hashicorp/tap/terraform # OR brew install opentofu
brew install hashicorp/tap/packer
brew install kubectl
brew install hcloud
brew install coreutils
```

```

Script to setup Snapshot in HCLOUD Project -> read-write hcloud-api key has to be generated first
#!/bin/bash
tmp_script=$(mktemp) && curl -sSL -o "${tmp_script}" https://raw.githubusercontent.com/kube-hetzner/terraform-hcloud-kube-hetzner/master/scripts/create.sh && chmod +x "${tmp_script}" && "${tmp_script}" && rm "${tmp_script}"
```
