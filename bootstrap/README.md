# Linoproject Automations Deploy Bootstrap VM (via VM DEMO)
Just check the official VMware Fling here: [https://flings.vmware.com/demo-appliance-for-tanzu-kubernetes-grid#summary](https://flings.vmware.com/demo-appliance-for-tanzu-kubernetes-grid#summary)... and follow the guide to create the management cluster.

---
**NOTE**

My suggestion is to use the management cluster to handle utilitie and other useful stuff for the other cluster. 
For this reason set up the following elements:
- metallb (or AVI) for loadbalancing
- Ingress with NGINX
- HashiCorp Vault

---


## Hande Secret and certificates with Vault
It's possibile to use [HashiCorp Vault](https://www.vaultproject.io/) to handle secrets, kubeconfig, etc that are needed in the next steps.
My suggestion is to use the Management Cluster to install Vault via Helm. An example from the official documentation is available here

### Vault installation with Helm
In the vault directory there's the value file for helm installation:
`helm repo add hashicorp https://helm.releases.hashicorp.com`
`helm install vault hashicorp/vault -f vault/values.yaml`
When the deployment is completed you should see something like this:
`kubectl get pods -l app.kubernetes.io/name=vault`
```
NAME                                    READY   STATUS    RESTARTS   AGE
vault-0                                 0/1     Running   0          1m49s
```
To unseal vault issue the following instructions:
`kubectl exec -ti vault-0 -- vault operator init`
`kubectl exec -ti vault-0 -- vault operator unseal`
Further info:
- [https://www.vaultproject.io/docs/platform/k8s/helm/run](https://www.vaultproject.io/docs/platform/k8s/helm/run)
- [https://learn.hashicorp.com/tutorials/vault/kubernetes-minikube](https://learn.hashicorp.com/tutorials/vault/kubernetes-minikube)

To create secrets check here: [https://www.vaultproject.io/docs/secrets/kv/kv-v2](https://www.vaultproject.io/docs/secrets/kv/kv-v2)

### Certificate generation with Vault
Check the offical guides: 
- [https://www.vaultproject.io/docs/secrets/pki](https://www.vaultproject.io/docs/secrets/pki)
- [https://learn.hashicorp.com/tutorials/vault/pki-engine#step-1-generate-root-ca](https://learn.hashicorp.com/tutorials/vault/pki-engine#step-1-generate-root-ca) -> This is the best guide to start dealing with TLS SSL certificates

## Handle DNS registration (TODO)

## Automate the deployment with Terraform (TODO)