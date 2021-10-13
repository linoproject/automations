# Flux installation

## Requirements
- Gitlab/GitHub repo and connections from K8s cluster to Repo and credentials
- chartmuesum
- ca Files in base64 (only if you're using an internal CA)

Note: all connection must be in https

## Installation
- create flux-system namespace
- Modify flux-manifest user with the correct elements
- Apply flux-manifest-uoser and deploy