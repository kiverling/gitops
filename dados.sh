#!/bin/bash
if [ -z "$1" ]; then
    echo missing namespace
    exit 1
fi

kubectl create -n $1 secret tls traitor-cert --cert=certs/hellfish.test.crt --key=certs/hellfish.test.key
