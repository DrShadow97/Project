@echo off
if ""=="%~1" (
	exit
) else (
	C:\Project\bin\youtube-dl --no-resize-buffer -c -i -f best[ext=mp4] -o "%%(title)s.%%(ext)s" "%~1"
	exit
)
