@echo off
color 0a
mode con cols=34 lines=7
C:\Project\bin\adb shell rm -f -rR "/sdcard/DCIM/.thumbnails" >NUL
C:\Project\bin\adb shell rm -f -rR "/sdcard/WhatsApp/Media/WhatsApp Animated Gifs/Sent" >NUL
C:\Project\bin\adb shell rm -f -rR "/sdcard/WhatsApp/Media/WhatsApp Video/Sent" >NUL
C:\Project\bin\adb shell rm -f -rR "/sdcard/WhatsApp/Media/WhatsApp Images/Sent" >NUL
C:\Project\bin\adb shell rm -f -rR "/sdcard/WhatsApp/Media/WhatsApp Audio/Sent" >NUL
C:\Project\bin\adb shell rm -f -rR "/sdcard/WhatsApp/Media/WhatsApp Documents/Sent" >NUL

echo __________________________________
echo  Moviendo archivos del celular...
start "adbCelu" /min C:\Project\bin\adb -a pull "/sdcard/download" "%userprofile%\Celu\download"
start "adbCelu" /min C:\Project\bin\adb -a pull "/sdcard/Pictures" "%userprofile%\Celu\Pictures"
start "adbCelu" /min C:\Project\bin\adb -a pull "/sdcard/DCIM" "%userprofile%\Celu\DCIM"
start "adbCelu" /min C:\Project\bin\adb -a pull "/sdcard/WhatsApp/Media/.Statuses" "%userprofile%\Celu\WhatsApp\Media\.Statuses"
start "adbCelu" /min C:\Project\bin\adb -a pull "/sdcard/WhatsApp/Media/WhatsApp_Statuses" "%userprofile%\Celu\WhatsApp\Media\WhatsApp_Statuses"
start "adbCelu" /min C:\Project\bin\adb -a pull "/sdcard/WhatsApp/Media/WhatsApp Animated Gifs" "%userprofile%\Celu\WhatsApp\Media\WhatsApp Animated Gifs"
start "adbCelu" /min C:\Project\bin\adb -a pull "/sdcard/WhatsApp/Media/WhatsApp Video" "%userprofile%\Celu\WhatsApp\Media\WhatsApp Video"
start "adbCelu" /min C:\Project\bin\adb -a pull "/sdcard/WhatsApp/Media/WhatsApp Images" "%userprofile%\Celu\WhatsApp\Media\WhatsApp Images"
start "adbCelu" /min C:\Project\bin\adb -a pull "/sdcard/WhatsApp/Media/WhatsApp Audio" "%userprofile%\Celu\WhatsApp\Media\WhatsApp Audio"
start "adbCelu" /min C:\Project\bin\adb -a pull "/sdcard/WhatsApp/Media/WhatsApp Documents" "%userprofile%\Celu\WhatsApp\Media\WhatsApp Documents"
start "adbCelu" /min C:\Project\bin\adb -a pull "/sdcard/Telegram/Telegram Audio" "%userprofile%\Celu\Telegram\Telegram Audio"
start "adbCelu" /min C:\Project\bin\adb -a pull "/sdcard/Telegram/Telegram Images" "%userprofile%\Celu\Telegram\Telegram Images"
start "adbCelu" /min C:\Project\bin\adb -a pull "/sdcard/Telegram/Telegram Documents" "%userprofile%\Celu\Telegram\Telegram Documents"
start "adbCelu" /min C:\Project\bin\adb -a pull "/sdcard/Telegram/Telegram Video" "%userprofile%\Celu\Telegram\Telegram Video"

:waitADB
for /f %%a in ('tasklist /fi "windowtitle eq adbCelu"') do (
	timeout /nobreak /t 1 >NUL
	if "%%a"=="adb.exe" (goto :waitADB)
)
taskkill /f /im adb.exe >NUL

echo  Ya puede desconectar el celular

echo  Eliminando duplicados...
start /min C:\CloneSpy\CloneSpy64 -p1 "%userprofile%\Celu\WhatsApp\Media" -a C:\Project\settings.cst -e
	timeout /nobreak /t 5 >NUL
start /min C:\CloneSpy\CloneSpy64 -p1 "%userprofile%\Celu\Telegram" -a C:\Project\settings.cst -e
	timeout /nobreak /t 5 >NUL
start /min C:\CloneSpy\CloneSpy64 -p1 "%userprofile%\Celu\Pictures" -a C:\Project\settings.cst -e
	timeout /nobreak /t 5 >NUL
start /min C:\CloneSpy\CloneSpy64 -p1 "%userprofile%\Celu\download" -a C:\Project\settings.cst -e

:waitCloneSpy
for /f %%a in ('tasklist /fi "imagename eq CloneSpy64.exe"') do (
	timeout /nobreak /t 1 >NUL
	if "%%a"=="CloneSpy64.exe" (goto :waitCloneSpy)
)

echo  Ordenando por fecha...
start /min dateSorting "%userprofile%\Celu\WhatsApp\Media\.Statuses"
start /min dateSorting "%userprofile%\Celu\WhatsApp\Media\WhatsApp Animated Gifs"
start /min dateSorting "%userprofile%\Celu\WhatsApp\Media\WhatsApp Video"
start /min dateSorting "%userprofile%\Celu\WhatsApp\Media\WhatsApp Images"
start /min dateSorting "%userprofile%\Celu\WhatsApp\Media\WhatsApp Audio"
start /min dateSorting "%userprofile%\Celu\WhatsApp\Media\WhatsApp Documents"
start /min dateSorting "%userprofile%\Celu\WhatsApp\Media\WhatsApp_Statuses"
start /min dateSorting "%userprofile%\Celu\Telegram\Telegram Audio"
start /min dateSorting "%userprofile%\Celu\Telegram\Telegram Images"
start /min dateSorting "%userprofile%\Celu\Telegram\Telegram Video"
start /min dateSorting "%userprofile%\Celu\Telegram\Telegram Documents"
