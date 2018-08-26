@echo off
set CONFIG_ARCHIV="..\..\Data\config.7z"
set DATA_ARCHIV="..\..\Data\nextcloud.7z"
:: [ 0 | 1 | 3 | 5 | 7 | 9 ]
set COMPRESSION=0
set SEVENEXE="libs\7-Zip\7za.exe"
set PASSWD=%1
set RUNTIME_CONFIG_DIR=%USERPROFILE%\AppData\Local\nextcloud
set RUNTIME_NEXTCLOUD_DATA_DIR="..\..\Data\nextcloud"
set LOG_FILE="..\..\Data\nextcloudPortableEncryption.log"

echo This is the nextcloud Portable encryption starter script! > %LOG_FILE%

if not exist %CONFIG_ARCHIV% (
	echo Can't find %CONFIG_ARCHIV% >> %LOG_FILE%
	START /WAIT setup.bat
) else (
	echo Extracting portable nextcloud client config and data... >> %LOG_FILE%
	%SEVENEXE% x %CONFIG_ARCHIV% -o%RUNTIME_CONFIG_DIR% -p%PASSWD% -y >> %LOG_FILE% || (start cmd /C "echo Wrong Password & pause" & exit)
	%SEVENEXE% x %DATA_ARCHIV% -o%RUNTIME_NEXTCLOUD_DATA_DIR% -r -p%PASSWD% -y >> %LOG_FILE% || (start cmd /C "echo Wrong Password & pause" & exit)
	del /s /f /q %DATA_ARCHIV%
)

echo Starting nextcloud client. >> %LOG_FILE%
START /WAIT ..\nextcloud\nextcloud.exe >> %LOG_FILE%

echo Encrypting nextcloud client config and data... >> %LOG_FILE%
:: Explanation:
::   -mhe to encrypt headers so nobody can browse the archive
::   -mx0 to not compress the archiv (only for performance)
%SEVENEXE% u %CONFIG_ARCHIV% %RUNTIME_CONFIG_DIR%\nextcloud.cfg -mx%COMPRESSION% -mhe -p%PASSWD% -y >> %LOG_FILE%
%SEVENEXE% a %DATA_ARCHIV% %RUNTIME_NEXTCLOUD_DATA_DIR%\* -mx%COMPRESSION% -mhe -p%PASSWD% -y >> %LOG_FILE%

echo Securely removing data from this computer... >> %LOG_FILE%
del /s /f /q %RUNTIME_NEXTCLOUD_DATA_DIR% & rd /s /q %RUNTIME_NEXTCLOUD_DATA_DIR% >> %LOG_FILE%
del /s /f /q %RUNTIME_CONFIG_DIR%\nextcloud.cfg >> %LOG_FILE%

:exit