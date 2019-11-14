@echo off
:again
set /p link="Pegue el link aqui: "
if "%link%"=="exit" (goto :eof)
if "%link%"=="" (goto :again)
for /F "tokens=2 delims=/" %%a in ("%link%") do (
	if "%%a"=="www.mediafire.com" (call mediafire.bat %link%)
	if "%%a"=="mega.nz" (call mega.bat %link%)
)
goto :again