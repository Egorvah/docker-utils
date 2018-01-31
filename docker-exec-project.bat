@echo off

set containerName=%1
set params=%*
call :strlen containerNameLength containerName
call set cmd=%%params:~%containerNameLength%%%

for %%* in (.) do set projectDir=%%~nx*

docker exec -it %containerName% /bin/sh -c "cd /var/www/%projectDir% && %cmd%"

goto :eof

:strlen <resultVar> <stringVar>
(   
    setlocal EnableDelayedExpansion
    set "s=!%~2!#"
    set "len=0"
    for %%P in (4096 2048 1024 512 256 128 64 32 16 8 4 2 1) do (
        if "!s:~%%P,1!" NEQ "" ( 
            set /a "len+=%%P"
            set "s=!s:~%%P!"
        )
    )
)
( 
    endlocal
    set "%~1=%len%"
    exit /b
)
