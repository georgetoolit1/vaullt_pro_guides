#!/bin/sh
set -o xtrace

#login into vault
vault login root
#check the status of vault server
vault status

#enable audit and write logs to a file
vault audit enable file file_path=/var/log/vault_audit.log

#enable another audit and log to another file but with raw data
vault audit enable -path="file_raw" file log_raw=true file_path=/var/log/vault_audit_raw.log