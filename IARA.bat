@echo on
title IARA
color 0a
cls
if ""=="%~1" (goto :exit)
set "input=%~1"
pushd %input%
popd
if %errorlevel%==0 (
	echo ¿Que deseas que haga con esta carpeta?
	pause
) else (
	cls
	pause
	for %%F in ("%input%") do set output="%%~xF"
	if %output%==".txt" (
		for /F "tokens=*" %%a in (%input%) do (
			pause
			set "linea=%%a"
			echo "%linea%"
			for /F "tokens=2 delims=/" %%b in ("%%a") do (
				if "%%b"=="www.mediafire.com" (call mediafire.bat "%%a")
				if "%%b"=="mega.nz" (call mega.bat "%%a")
			)
		)
	)
	if %output%==".mkv" (run "%input%")
	if %output%==".mp4" (run "%input%")
	if %output%==".mp3" (run "%input%")
	timeout /t 1 >nul
	echo Que deseas que haga con este archivo?
)
echo %input%
pause
goto :EOF
:exit
echo Hola soy IARA, tu asistente virtual.
echo Que deseas hacer?
pause>nul