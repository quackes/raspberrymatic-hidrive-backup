#!/bin/sh

CLIENT_ID=$(cat CLIENT_ID)
CLIENT_SECRET=$(cat CLIENT_SECRET)

echo "open in browser:"
auth_code_url="https://www.hidrive.strato.com/oauth2/authorize?client_id=$CLIENT_ID&response_type=code&scope=user,rw"
echo $auth_code_url


echo "Paste authorization_code"
read auth_code

curl -v -X POST --data "client_id=$CLIENT_ID\
&client_secret=$CLIENT_SECRET\
&grant_type=authorization_code\
&code=$auth_code" \
https://www.hidrive.strato.com/oauth2/token | jq '.refresh_token' | tr -d '"' > refresh_token