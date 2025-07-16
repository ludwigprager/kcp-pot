#!/usr/bin/env bash

set -eu
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $BASEDIR

# sudo pacman -S --noconfirm docker git kubectl yay screen

mkdir -p bin/

export PATH=$PATH:$(realpath .)/bin/
export KUBECONFIG=$(realpath .)/.kcp/admin.kubeconfig

#if [[ ! -d kcp ]]; then
#  git clone https://aur.archlinux.org/kcp.git
#fi

if [[ ! -x bin/kcp ]]; then
  wget -nc https://github.com/kcp-dev/kcp/releases/download/v0.27.1/kcp_0.27.1_linux_amd64.tar.gz
  tar zxvf kcp_0.27.1_linux_amd64.tar.gz
fi

if [[ ! -x bin/kubectl-kcp ]]; then
  wget -nc https://github.com/kcp-dev/kcp/releases/download/v0.27.1/kubectl-kcp-plugin_0.27.1_linux_amd64.tar.gz
  tar zxvf kubectl-kcp-plugin_0.27.1_linux_amd64.tar.gz
fi

if [[ ! -x bin/kubectl-ws ]]; then
  wget -nc https://github.com/kcp-dev/kcp/releases/download/v0.27.1/kubectl-ws-plugin_0.27.1_darwin_amd64.tar.gz
  tar zxvf kubectl-ws-plugin_0.27.1_darwin_amd64.tar.gz
fi

if ! screen -list | grep -q "kcp"; then
  screen -S kcp -d -m ./bin/kcp start
fi

