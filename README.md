# Linoproject Automations

## Bootstrap
- Deploy demo VM 
- Deploy mgmt cluster via VMDemo:
  - Create CA Keycert and certificates
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
  - via Kaniko (WIP)
- Create Tanzu Kubernetes Grid Cluster from vSphere w Tanzu namespace
- Create Tanzu Kubernetes Grid Cluster from Management Cluster

## Links

## Tools
- SSL Cert script (link)