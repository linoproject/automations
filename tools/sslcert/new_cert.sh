#!/bin/bash

DOMAIN="linoproject.lab"
ENTRY=$1
IP=$2
KEY=$3

if [ -z $ENTRY ]; then
	echo "Usage: $0 <entry>.$DOMAIN [<ip>] [<path_to_private_key_file>]"
	exit 1
fi

if [ ! -f ./rootCA.pem ]; then
	echo "Generating new rootCA cert"
	openssl genrsa -des3 -out rootCA.key 2048
	openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1460 -out rootCA.pem
fi

if [ ! -d $ENTRY ]; then
	echo "Creating directory"
	mkdir $ENTRY
fi

cat <<EOF > $ENTRY/req.cnf 
[req]
req_extensions = v3_req
distinguished_name = req_distinguished_name
prompt = no

[req_distinguished_name]
C = IT
L = Cremona
O = Linoproject
CN = ${ENTRY}.${DOMAIN}

[v3_req]
basicConstraints = CA:FALSE
keyUsage = nonRepudiation, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alternate_names
nsComment = "OpenSSL Generated Certificate"

[alternate_names]
DNS.0 = ${ENTRY}.${DOMAIN}
EOF

if [ ! -z $IP ]; then
	echo "IP.0 = ${IP}" >> $ENTRY/req.cnf
fi

if [ ! -f $ENTRY/$ENTRY.$DOMAIN.key ]; then
	if [ -z $KEY ]; then
		echo "Automatic key generation or put your own"
		openssl genrsa -out $ENTRY/$ENTRY.$DOMAIN.key 2048 
	else
		cp $KEY $ENTRY/$ENTRY.$DOMAIN.key
	fi
fi

echo "Creating sign request"
openssl req -new -key $ENTRY/$ENTRY.$DOMAIN.key -out $ENTRY/$ENTRY.$DOMAIN.csr -config $ENTRY/req.cnf
echo "Sign the certificate"
openssl x509 -req -in $ENTRY/$ENTRY.$DOMAIN.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out $ENTRY/$ENTRY.$DOMAIN.crt -days 1000 -sha256 -extfile $ENTRY/req.cnf


