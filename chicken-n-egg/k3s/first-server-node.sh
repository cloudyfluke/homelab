#!/usr/bin/env bash

export IP=192.168.0.24
export VIP=192.168.0.100
export K3S_VERSION=v1.31.5+k3s1

if [[ -f $HOME/.kube/config ]]; then
	mv $HOME/.kube/config $HOME/.kube/config.old
fi

# NOTE:
# Install k3s without Traefik or k3s servicelb because
# I want it as bare as possible.
k3sup install --ip $IP \
	--user ubuntu \
	--sudo \
	--tls-san $VIP \
	--cluster \
	--merge \
	--no-extras \
	--local-path $HOME/.kube/config \
	--context=default \
	--k3s-version $K3S_VERSION
