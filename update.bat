@echo off
cd C:\Project\version
start /min %LOCALAPPDATA%\MEGAcmd\MEGAcmdUpdater
..\bin\wget -q -N -O "C:\Project\bin\axel.exe" "https://github.com/Rergis/axel-for-windows/raw/master/axel.exe"
..\bin\wget -q -N -O "C:\Project\bin\cygwin1.dll" "https://github.com/Rergis/axel-for-windows/raw/master/cygwin1.dll"
if exist C:\Project\bin\youtube-dl.exe (
	start /min youtube-dl -U
) else (
	..\bin\wget -b -q -N -O "C:\Project\bin\youtube-dl.exe" "https://yt-dl.org/latest/youtube-dl.exe">nul
)
..\bin\wget -b -q -N -O "C:\Project\bin\adb.exe" "https://raw.githubusercontent.com/koush/UniversalAdbDriver/master/adb.exe">nul
..\bin\wget -b -q -N -O "C:\Project\bin\AdbWinApi.dll" "https://raw.githubusercontent.com/koush/UniversalAdbDriver/master/AdbWinApi.dll">nul
..\bin\wget -b -q -N -O "C:\Project\bin\AdbWinUsbApi.dll" "https://raw.githubusercontent.com/koush/UniversalAdbDriver/master/AdbWinUsbApi.dll">nul
..\bin\wget -b -q -N "http://www.compulsivecode.com/Images/ImageToPDForXPS.zip">nul
set xOS=64
IF %PROCESSOR_ARCHITECTURE% == x86 (IF NOT DEFINED PROCESSOR_ARCHITEW6432 Set xOS=32)
if %xOS%==64 (
	..\bin\wget -b -q -N -O "C:\Project\bin\gdrive.exe" "https://drive.google.com/uc?id=1zEaLExCMQnwftSYCF7GTONHX-lV7SlTe&export=download">nul
	..\bin\wget -q -N "https://ffmpeg.zeranoe.com/builds/win64/static/ffmpeg-latest-win64-static.zip"
) else (
	..\bin\wget -b -q -N -O "C:\Project\bin\gdrive.exe" "https://drive.google.com/uc?id=1nbwcqKI1ohhjbUKLH2NcPSRKvYdBwfEI&export=download">nul
	..\bin\wget -q -N "https://ffmpeg.zeranoe.com/builds/win32/static/ffmpeg-latest-win32-static.zip"
)
if NOT exist "C:\Project\bin\fonts\fonts.conf" (
	mkdir C:\Project\bin\fonts
	..\bin\wget -b -q -N -O "C:\Project\bin\fonts\fonts.conf" "https://raw.githubusercontent.com/FiveYellowMice/how-to-convert-videos-with-ffmpeg-zh/master/etc/fontconfig-windows/fonts.conf">nul
)
rem ..\bin\wget "https://ufpr.dl.sourceforge.net/project/mpxplay/Mpxplay/Mpxplay%20v1.64/Mpxplay_v164_Win32_FFmpeg.zip"
rem OpenCL.dll
..\bin\wget --spider -N -nv -erobots=off -np -nd -r -l 1 -A zip "https://eternallybored.org/misc/wget/releases/"
rem ..\bin\wget -N -nv https://download.sysinternals.com/files/PSTools.zip
"%ProgramFiles%\WinRAR\WinRAR.exe" e *.zip *.exe ..\bin\ -IBCK -u -y
"%ProgramFiles%\WinRAR\WinRAR.exe" e *.zip *.dll ..\bin\ -IBCK -u -y

start /min %LOCALAPPDATA%\MEGAcmd\mega-version