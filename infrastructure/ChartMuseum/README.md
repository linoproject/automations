# ChartMuseum Installation and config

## Requirements
- Ingress with NGINX (free or commercial editions)
- Create TLS certificates (highly suggested with Hashicorp Vault)

## Installation with TLS

- `kubectl create namespace chartmuseum`
- `helm repo add chartmuseum https://chartmuseum.github.io/charts`
- `helm install chartmuseum --namespace chartmuseum chartmuseum/chartmuseum --set env.open.DISABLE_API=false`
- `kubectl -n chartmuseum create secret tls chartmuseum-tls --cert=cert.pem --key=cert.key`
- `kubectl -n chartmuseum  apply -f chartmuseum-ingress.yaml`
