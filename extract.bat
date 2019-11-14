@echo off
set winrar="C:\Program Files\WinRAR\"
if "%~1"=="" (set /p "fichero= Extraer fichero: ") else (set "fichero=%~1")
for %%F in ("%fichero%") do (set "type=%%~xF")
if "%type%"==".rar" (
	if "%~2"=="" (%winrar%UnRAR.exe x %fichero%) else (%winrar%UnRAR.exe x -p%~2 %fichero%)
) else (
	if "%~2"=="" (%winrar%WinRAR.exe x %fichero%) else (%winrar%WinRAR.exe x -p%~2 %fichero%)
)
