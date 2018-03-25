# raspberrymatic-hidrive-backup
Creates Backup of raspberrymatic system add uploads it to a defined folder in hidride

## Usage

Needs a HiDrive API Key with out-of-band flow (not tested with other flows)

Add your CLIENT_ID and CLIENT_SECRET to the corrosponding Files

copy all files to your raspberrymatic instance. (e.g. /usr/local/etc/backup)

use crontab or homematic features to run in desired frequence (e.g. daily)
refer to https://technikkram.net/2018/02/raspberrymatic-einfache-automatische-sicherung-auf-usb-medium for automation options with homematic

**uploadBackup.sh** :

Change BACKUP_FOLDER to the Folder where you want to store your backup

run script to create and upload backup

**createBackupRefreshToken.sh** :

Run to create a refresh token for a HiDrive user. Needs user interaction

Open the displayed url in a browser, authorize, and paste autorization code to shell.

refresh token is stored to file with the name refresh_token
note, that the refresh token expires after 60 days, if its not used.




