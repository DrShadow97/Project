@echo off
if ""=="%~1" (
	exit
) else (
	C:\Project\bin\youtube-dl --no-resize-buffer -x --audio-format "mp3" -c -i -f best -o "%%(title)s.%%(ext)s" "%~1"
	exit
)
