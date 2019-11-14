@echo on
title Descargar de Mediafire
set background=0
set wget=C:\Project\bin\wget.exe
if exist "%tmp%\Mediafire.html" (del "%tmp%\Mediafire.html")
if exist "%tmp%\Mediafire.tmp" (del "%tmp%\Mediafire.tmp")
if "%~1"=="" (
	set linkMediafire=""
	:again
	set /p "linkMediafire=Pegue el link aqui: "
) else (
	if "%~1"=="-b" (
		set background=1
		set linkMediafire="%~2"
		call :download
		goto :eof
	)
)

if "%linkMediafire%"=="" (goto :again)
if "%linkMediafire%"=="exit" (goto :eof)
if "%linkMediafire%"=="set background" (
	set background=1
	goto :again
)
call :download
goto :again

:download
%wget% -c -nc -q -O %tmp%\Mediafire.html "%linkMediafire%"
set linkMediafire=%linkMediafire:~30%
for /F "tokens=1 delims=/" %%a in ("%linkMediafire%") do (set linkMediafire=%%a)
findstr "download.*%linkMediafire%" %tmp%\Mediafire.html>%tmp%\Mediafire.tmp
del %tmp%\Mediafire.html
for /F delims^=^"^ tokens^=2 %%b in (%tmp%\Mediafire.tmp) do (
	set "linkMediafire=%%b"
	del %tmp%\Mediafire.tmp
	call :wget
	goto :eof
)
:wget
if "%background%"=="0" (%wget% -c %linkMediafire%) else (%wget% -b -c %linkMediafire%)
echo 
echo 