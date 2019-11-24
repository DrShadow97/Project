@echo off
title Descargar de Mega
set "client=%localappdata%\MEGAcmd\"

if ""=="%~1" (
	echo 
) else (
	start /min %client%mega-get --ignore-quota-warn %~1
	goto :eof
)