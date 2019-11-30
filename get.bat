@echo off
if not "%~1"=="" (
	for /F "tokens=2 delims=/" %%a in ("%~1) do (
		if "%%a"=="www.mediafire.com" (call mediafire %link%)
		if "%%a"=="mega.nz" (call mega %link%)
	)
) else (
	:again
	set /p link="Pegue el link aqui: "
	if "%link%"=="exit" (goto :eof)
	if "%link%"=="" (goto :again)
	for /F "tokens=2 delims=/" %%a in ("%link%") do (
		if "%%a"=="www.mediafire.com" (call mediafire %link%)
		if "%%a"=="mega.nz" (call mega %link%)
	)
	goto :again
)
