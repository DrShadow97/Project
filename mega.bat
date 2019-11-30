@echo off
title Descargar de Mega
set "client=%localappdata%\MEGAcmd\"

if not ""=="%~1" (
	if "%~1"=="-b" (
		start /min %client%MegaClient.exe get --ignore-quota-warn %~2
	) else (
		call %client%mega-get --ignore-quota-warn %~1
	)
)