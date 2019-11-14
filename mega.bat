@echo off
title Descargar de Mega
set "client=%localappdata%\MEGAcmd\"
call :checkserver

if ""=="%~1" (
	%client%mega-lcd "%cd%"
	:again
	set linkmega=""
	set /p linkmega=" Pegue el link aqui: "
	if "%linkmega%"=="" (goto :again)
) else (
	start /min %client%mega-get --ignore-quota-warn %~1
	goto :eof
)
if "%linkmega%"=="exit" (goto :eof)
"%client%mega-get" --ignore-quota-warn "%linkmega%"
goto :again

:checkserver
set server=0
for /f %%a in ('tasklist /fi "imagename eq MEGAcmdServer.exe"') do (
	if "%%a"=="MEGAcmdServer.exe" (set server=1)
)
if %server%==0 (
	start /min /wait %client%MEGAcmdServer.exe
)