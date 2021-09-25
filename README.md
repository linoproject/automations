# Linoproject Automations Table of Content

## Bootstrap
- [Deploy bootstrap VM (with Vault and certificate)](bootstrap)
- Deploy mgmt cluster via VMDemo:
  - Deploy Gitlab (with custom cert)
  - Deploy Harbor (with custom cert)
  - Deploy Jenkins
    - Add CA Key cert on values
    - Configure Jenkins credentials:
      - gitlab
      - demo VM
      - kubeconfig file for mgmt
- Create vSphere 7 Tanzu namespace automation example

## Example pipelines
- Image Build Pipeline (basic usage for vSphere Tanzu)
  - via DEMO VM
  - via Kaniko (TODO)
- Create Tanzu Kubernetes Grid Cluster from vSphere w Tanzu namespace
- Create Tanzu Kubernetes Grid Cluster from Management Cluster
