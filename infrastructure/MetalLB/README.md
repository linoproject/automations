# MetaLB Installation

## Installation steps
- `kubectl create namespace metallb-system`
- `kubectl -n metallb-system create secret generic  memberlist --from-literal=secretkey="$(openssl rand -base64 128)"`
- `kubectl -n metallb-system create configmap config --from-file=config`
- `kubectl -n metallb-system apply -f metallb.yaml`