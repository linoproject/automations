# Gitlab installation and configuration
Here an example on how to create a gitlab instance on kubernetes with Helm and exposing via SSL with a custom CA 

## Certificate generation with vault
- Create a CA (if is not already present)
- Issue a certificate: gitlab.<your_domain>
- Download ca.pem, cert.pem and cert.key

## Prepare namespace
Create namespace and add a tls secret (keep in mind that the tls secret name must be specified also in values.yaml e.g.: secretName: gitlab-cert-1)
`kubectl create namespace gitlab`
`kubectl -n gitlab create secret tls gitlab-cert-1 --cert=cert.pem --key=cert.key`

## Installation
`helm repo add hashicorp https://helm.releases.hashicorp.com`

Change the values of domain and external url according to your local domain in the file gitlab-values.yaml (and also the secret name). Then:
`helm install -n gitlab gitlab gitlab/gitlab -f gitlab-values.yaml`

## Get root password
`kubectl -n gitlab get secret gitlab-gitlab-initial-root-password -ojsonpath='{.data.password}' | base64 --decode ; echo`