@echo off
if ""=="%~1" (goto :eof)
set SDL_AUDIODRIVER=directsound
set ffplay=C:\Project\bin\ffplay
for %%F in ("%~1") do (
	set "title=%%~nF"
	if "%%~xF"==".gif" (goto :gif)
	if "%%~xF"==".wav" (goto :music)
	if "%%~xF"==".mid" (goto :music)
	if "%%~xF"==".mp3" (goto :music)
	if "%%~xF"==".opus" (goto :music)
	if "%%~xF"==".3gp" (goto :video)
	if "%%~xF"==".avi" (goto :video)
	if "%%~xF"==".mp4" (goto :video)
	if "%%~xF"==".mkv" (goto :video)
	if "%%~xF"==".mpg" (goto :video)
	if "%%~xF"==".mpeg" (goto :video)
	if "%%~xF"==".wmv" (goto :video)
	if "%%~xF"==".mov" (goto :video)
	if "%%~xF"==".bmp" (goto :image_txt)
	if "%%~xF"==".jpeg" (goto :image_txt)
	if "%%~xF"==".jpg" (goto :image_txt)
	if "%%~xF"==".png" (goto :image_txt)
	if "%%~xF"==".txt" (goto :image_txt)
	:gif
	%ffplay% -window_title "%title%" -autoexit -loop 20 "%~1">NUL
	goto :eof
	:image_txt
	%ffplay% -window_title "%title%" "%~1">NUL
	goto :eof
	:music
	%ffplay% -window_title "%title%" -showmode 1 -autoexit "%~1">NUL
	goto :eof
	:video
	%ffplay% -fs -window_title "%title%" -autoexit "%~1">NUL
	goto :eof
)
