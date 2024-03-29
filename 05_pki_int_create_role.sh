#!/bin/sh
set -o xtrace

export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=root
export VAULT_NAMESPACE=

# create a role to generate new certificates
vault write pki_int/roles/goerge-toolit-com \
    allowed_domains="georgetoolit.com" \
    allow_subdomains="true" \
    max_ttl="720h"

#vault delete pki_int_r/roles/george-toolit-com

