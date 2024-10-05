#!/bin/bash

# Exit on first error
set -e

# Generate SSL certificate
# https://wiki.squid-cache.org/Features/DynamicSslCert
# + https://superuser.com/questions/1129221/openssl-req-new-with-some-default-subj-values

# Should actually be a hostname of your server here
cn="localhost"

openssl req -new -newkey rsa:2048 -sha256 -days 365 -nodes -x509 -extensions v3_ca -keyout squidCA.pem  -out squidCA.pem -subj "/CN=$cn/emailAddress=admin@$cn/C=US/ST=Ohio/L=Columbus/O=Widgets Inc/OU=Some Unit"
# This file is for importing in browser:
openssl x509 -in squidCA.pem -outform DER -out squidCA.der

################################################
# https://unix.stackexchange.com/a/600504

# echo "===== rootCA.key, RSA"
# openssl genrsa -des3 -out rootCA.key 4096
# echo "===== rootCA.key, CRT"
# openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1024 -out rootCA.crt
# echo "===== squidCA.key, RSA"
# openssl genrsa -out squidCA.key 2048
# echo "===== squidCA.key, CSR"
# openssl req -new -key squidCA.key -out squidCA.csr
# echo "===== squidCA.key, CRT+KEY"
# openssl x509 -req -in squidCA.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out squidCA.crt -days 500 -sha256
# echo "===== squidCA.key, PEM"
# cat squidCA.key squidCA.crt > squidCA.pem


