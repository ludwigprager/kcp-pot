#!/usr/bin/env bash

set -eu
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $BASEDIR

# sudo pacman -S --noconfirm docker git kubectl yay screen


export PATH=$PATH:$(realpath .)/bin/
export KUBECONFIG=$(realpath .)/.kcp/admin.kubeconfig

kubectl kcp workspace create my-workspace || true
kubectl kcp workspace use my-workspace

#kubectl apply -f api-binding-kubernetes.yaml

#kubectl apply -f syncer.yaml
