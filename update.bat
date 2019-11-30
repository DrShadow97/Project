@echo off
cd C:\Project\version
start /min %LOCALAPPDATA%\MEGAcmd\MEGAcmdUpdater
set xOS=64
IF %PROCESSOR_ARCHITECTURE% == x86 (IF NOT DEFINED PROCESSOR_ARCHITEW6432 Set xOS=32)
if %xOS%==64 (
	..\bin\wget -b -q -N -O "C:\Project\bin\gdrive.exe" "https://drive.google.com/uc?id=1zEaLExCMQnwftSYCF7GTONHX-lV7SlTe&export=download">nul
	..\bin\wget -b -q -N "https://ffmpeg.zeranoe.com/builds/win64/static/ffmpeg-latest-win64-static.zip">nul
) else (
	..\bin\wget -b -q -N -O "C:\Project\bin\gdrive.exe" "https://drive.google.com/uc?id=1nbwcqKI1ohhjbUKLH2NcPSRKvYdBwfEI&export=download">nul
	..\bin\wget -b -q -N "https://ffmpeg.zeranoe.com/builds/win32/static/ffmpeg-latest-win32-static.zip">nul
)
if NOT exist "C:\Project\bin\fonts\fonts.conf" (
	mkdir C:\Project\bin\fonts
	..\bin\wget -b -q -N -O "C:\Project\bin\fonts\fonts.conf" "https://raw.githubusercontent.com/FiveYellowMice/how-to-convert-videos-with-ffmpeg-zh/master/etc/fontconfig-windows/fonts.conf">nul
)
if exist C:\Project\bin\youtube-dl.exe (
	start /min ..\bin\youtube-dl -U
) else (
	..\bin\wget -b -q -N -O "C:\Project\bin\youtube-dl.exe" "https://yt-dl.org/latest/youtube-dl.exe">nul
)
..\bin\wget -b --spider -N -q -erobots=off -np -nd -r -l 1 -A zip "https://eternallybored.org/misc/wget/releases/">nul
..\bin\wget -b -q -N -O "C:\Project\bin\axel.exe" "https://github.com/DrShadow97/Project/raw/master/bin/axel.exe">nul
..\bin\wget -b -q -N -O "C:\Project\bin\cygwin1.dll" "https://github.com/DrShadow97/Project/raw/master/bin/cygwin1.dll">nul
..\bin\wget -b -q -N -O "C:\Project\bin\adb.exe" "https://raw.githubusercontent.com/koush/UniversalAdbDriver/master/adb.exe">nul
..\bin\wget -b -q -N -O "C:\Project\bin\AdbWinApi.dll" "https://raw.githubusercontent.com/koush/UniversalAdbDriver/master/AdbWinApi.dll">nul
..\bin\wget -b -q -N -O "C:\Project\bin\AdbWinUsbApi.dll" "https://raw.githubusercontent.com/koush/UniversalAdbDriver/master/AdbWinUsbApi.dll">nul
..\bin\wget -b -q -N "http://www.compulsivecode.com/Images/ImageToPDForXPS.zip">nul
rem ..\bin\wget "https://ufpr.dl.sourceforge.net/project/mpxplay/Mpxplay/Mpxplay%20v1.64/Mpxplay_v164_Win32_FFmpeg.zip"
rem OpenCL.dll
rem ..\bin\wget -N -nv https://download.sysinternals.com/files/PSTools.zip
:wait
for /f %%a in ('tasklist /fi "imagename eq wget.exe"') do (
	timeout /nobreak /t 1 >NUL
	if "%%a"=="wget.exe" (goto :wait)
)
"%ProgramFiles%\WinRAR\WinRAR.exe" e *.zip *.exe ..\bin\ -IBCK -u -y
"%ProgramFiles%\WinRAR\WinRAR.exe" e *.zip *.dll ..\bin\ -IBCK -u -y