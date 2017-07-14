@echo off 
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
pause