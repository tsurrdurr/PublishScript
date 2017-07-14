@echo off 
set CSVFILE=lastresult.txt
if exist %CSVFILE% (
	for /F "usebackq tokens=* delims=" %%A in (%CSVFILE%) do (
    set the_line=%%A
    call :ProcessLine
	)	
) else (
	copy NUL %CSVFILE%
)
goto CopyFiles

:ProcessLine
for /F "usebackq tokens=1,2,3 delims=~" %%1 in ('%the_line:,=~%') do (
    set lastcopied=%%1
    set lastomitted=%%2
)

goto End

:CopyFiles
echo Copying files...
set copied=0
set omitted=0
for /r %1 %%a in (*) do (
    if exist "%2\%%~nxa" (
        copy /y "%%a" %2 >nul
		set /a "copied+=1"
    ) else (
		set /a "omitted+=1"
	)
) 
echo Files copied: %copied%; Omitted: %omitted%
echo %copied%,%omitted%,>%CSVFILE% 
if "%copied%" == "%lastcopied%" (
	echo Copied same amount as last time
) else (
	echo Copied DIFFERENT amount from last time: %lastcopied%
)
if "%omitted%" == "%lastomitted%" (
	echo Omitted same amount as last time
) else (
	echo Omitted DIFFERENT amount from last time: %lastomitted%
)
pause

:End