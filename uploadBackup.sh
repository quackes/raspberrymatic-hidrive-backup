#!/bin/sh

CLIENT_ID=$(cat CLIENT_ID)
CLIENT_SECRET=$(cat CLIENT_SECRET)

REMOTE_BACKUP_FOLDER="<changeme>"

#remove old backup
rm -f *.sbk

#create backup
/bin/createBackup.sh .

#get access token
refresh_token=$(cat refresh_token)

access_token=$(curl -X POST \
--data "client_id=$CLIENT_ID\
&client_secret=$CLIENT_SECRET\
&grant_type=refresh_token\
&refresh_token=$refresh_token" \
https://www.hidrive.strato.com/oauth2/token | jq '.access_token' | tr -d '"')


# upload backup
backupfile=$(ls *.sbk | tail -1)
echo "Uploading $backupfile"

curl -v -X POST \
    -H "Authorization: Bearer $access_token" \
    -H 'Content-Type: application/octet-stream' \
    --data-binary @$backupfile \
    https://api.hidrive.strato.com/2.1/file?dir=$REMOTE_BACKUP_FOLDER\&name=$backupfile