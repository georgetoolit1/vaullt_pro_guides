#!/bin/sh
set -o xtrace

VAULT_ADDR=http://localhost:8200
VAULT_TOKEN=root
VAULT_NAMESPACE=


#enable pki secrets engine for intermediate CA
vault secrets enable -path=pki_int pki

#set default ttl
vault secrets tune -max-lease-ttl=43800h pki_int

#create intermediate CA with common name georgetoolit.com and
#save the CSR(Certificate Signing Request) in a separate file
vault write -formate=json pki_int/intermediate/generate/internal \
    common_name="georgetoolit.com Intermediate Authority" \
    | jq -r .data.certificate
