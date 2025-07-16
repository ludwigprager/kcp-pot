#!/usr/bin/env bash

set -eu
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $BASEDIR

# sudo pacman -S --noconfirm docker git kubectl yay screen


export PATH=$PATH:$(realpath .)/bin/
export KUBECONFIG=$(realpath .)/.kcp/admin.kubeconfig

kubectl config use-context root
#kubectl ws use root:org:my-workspace
kubectl apply -f widget-crd.yaml

kubectl apply -f widget-sample.yaml

