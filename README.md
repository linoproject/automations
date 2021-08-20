# Linoproject Automations

## Bootstrap
- Deploy demo VM (terraform)
- Deploy mgmt cluster via CLI on VMDemo:
  - CA Keycert notes and scripts
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