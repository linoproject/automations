# Linoproject Automations: Jenkins installation

## Preapre Kube cluster
- Create namespace "jenkins"
- Apply jenkins-sa.yaml
- Apply jenkins-volume.yaml (this volume is the statefull part)

## Edit jenkins configurations
- Edit jenkins-values.yaml and change the following values:
  - `jenkinsUrl: "jenkins.linoproject.lab:8080"`
  - `loadBalancerSourceRanges:` with the correct value
  - CA certificate converted in BASE64

## Deploy jenkins (with Helm)
`helm -n jenkins install jenkins jenkinsci/jenkins -f jenkins-values.yaml`