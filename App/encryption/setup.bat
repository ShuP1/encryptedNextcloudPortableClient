@echo off
set CFG=%USERPROFILE%\AppData\Local\nextcloud\nextcloud.cfg

echo Nextcloud Setup

echo Server Url:
set /p URL=

echo Username:
set /p USER=

echo [General] > %CFG%
echo optionalDesktopNotifications=true >> %CFG%
echo [Accounts] >> %CFG%
echo version=2 >> %CFG%
echo 0\url=%URL% >> %CFG%
echo 0\http_user=%USER% >> %CFG%
echo 0\authType=http >> %CFG%
echo 0\user=%USER% >> %CFG%
echo 0\Folders\1\localPath=../../Data/nextcloud/ >> %CFG%
echo 0\Folders\1\targetPath=/ >> %CFG%
echo 0\Folders\1\paused=true >> %CFG%
echo 0\Folders\1\ignoreHiddenFiles=true >> %CFG%

exit