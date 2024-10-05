#!/usr/bin/env bash

# https://unix.stackexchange.com/questions/690072/curl-via-proxy-how-to-ignore-self-signed-certificate
# https://stackoverflow.com/questions/23655508/ssl-unable-to-obtain-common-name-from-peer-certificate

read -p 'Username: ' username
read -p 'Password: ' -s password

# Same as "cn" parameter in certificate generation
addr="localhost"

echo -e "\n\n===== HTTP proxy (should return that the page has been moved)\n\n"
curl -U "$username:$password" -x http://$addr:3128 http://google.com
echo -e "\n\n===== HTTPs proxy (should return that the page has been moved)\n\n"
curl --proxy-cacert squidCA.pem -U "$username:$password" -x https://$addr:3129 http://google.com

