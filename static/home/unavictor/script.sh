#!/bin/bash

openssl genpkey -algorithm RSA -out ANT.CA.key

openssl req -x509 -new -nodes -days 3650 -key ANT.CA.key -subj "/C=FR/ST=IDF/L=Paris/O=ANT/OU=ANT/CN=ANTCA" -out ANT.CA.crt

touch req_ext
touch san.cnf
echo "[ req ]
prompt                  = no
default_bits            = 2048
default_md              = sha256
req_extensions          = req_ext
distinguished_name      = dn

[ dn ]
C                       = FR
ST                      = IDF
L                       = Paris
O                       = ANT
CN                      = *.ANT.local

[ req_ext ]
subjectAltName          = @alt_names

[ alt_names ]
DNS.1                   = ANT.local
DNS.2                   = *.ANT.local" > san.cnf

echo "openssl genpkey -algorithm RSA -out ANT.local.key"
openssl genpkey -algorithm RSA -out ANT.local.key

echo 'openssl req -new -key ANT.local.key -out ANT.local.csr -subj "/C=FR/ST=IDF/L=Paris/O=ANT/OU=ANT/CN=*.ANT.local" -config san.cnf'
openssl req -new -key ANT.local.key -out ANT.local.csr -subj "/C=FR/ST=IDF/L=Paris/O=ANT/OU=ANT/CN=*.ANT.local" -config san.cnf

echo 'openssl x509 -req -days 365 -in ANT.local.csr -CA ANT.CA.crt -CAkey ANT.CA.key -CAcreateserial -extensions req_ext -extfile san.cnf -out ANT.local.crt'
openssl x509 -req -days 365 -in ANT.local.csr -CA ANT.CA.crt -CAkey ANT.CA.key -CAcreateserial -extensions req_ext -extfile san.cnf -out ANT.local.crt
