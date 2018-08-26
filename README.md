# Encrypted Nextcloud Portable Client

This is a portable Nextcloud client that runs on Windows.
At starttime a Batch file is executed and will prompt you for a password.
On first run this will set your password to encrypt the Nextcloud client configuration (host, user, password) and the data stored in your portable `Documents` folder.


## Install

1. Install 'nextcloudPortable_X.X-X.paf.exe' with PortableApps Plateform
2. Run Nextcloud
3. Enter a password
4. Setup nextcloud
5. Resume sync

## Used software

### Encrypted ownCloud Portable Client
https://github.com/BennyLi/encryptedOwnCloudPortableClient. Thanks to the author.

### Nextcloud
Currently packaged is the Nextcloud client version 2.3.3 from https://nextcloud.com/install/#install-clients.

### 7-Zip
For encrypted packaging a 7za.exe is included. This is the official portable one in version 16.04 from http://www.7-zip.org/download.html.

If you ask yourself if 7-Zip is secure enough, please reefer to http://security.stackexchange.com/questions/29375/is-7-zips-aes-encryption-just-as-secure-as-truecrypts-version.

### Bat To Exe Converter
To convert the start.bat to .exe I used Bat To Exe Converter version 2.2.0.0 from http://www.f2ko.de/en/b2e.php.
Currently I need an .exe file because the PortableApps Launcher cannot handle .bat files with the [WaitForEXEN](http://portableapps.com/manuals/PortableApps.comLauncher/ref/launcher.ini/launch.html#waitforexen) setting.
