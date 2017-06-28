@echo off
for /r %1 %%a in (*) do (
    if exist "%2\%%~nxa" (
        copy /y "%%a" %2 >nul
    ) 
) 