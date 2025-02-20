#!/usr/bin/env bash

export IP=192.168.0.24
export VIP=192.168.0.100
export K3S_VERSION=v1.31.5+k3s1

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
# --k3s-extra-args "--disable traefik --disable servicelb" \
