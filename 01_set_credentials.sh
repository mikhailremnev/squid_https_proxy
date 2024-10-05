#!/usr/bin/env bash

# https://gist.github.com/samba/789122387e7f7330890b

echo "Enter username and password to be used for proxy authentication"
password=$(tr -dc 'A-Za-z0-9!?%=' < /dev/urandom | head -c 10)
echo "Suggested random password: $password"


read -p "Username: " username
read -p "Password: " password

echo -ne "$username:`openssl passwd -apr1 \"$password\"`\n" > passwd_file
echo "Generated passwd_file"
cat passwd_file
