@echo off

    call ..\_config\setup.bat

    IF EXIST "..\_config\inc\clocks-%WORKER%.bat" (
      call ..\_config\inc\clocks-%WORKER%.bat
    )

    echo;

    echo   _ __          
    echo       \ \/ / /\ \
    echo        \  / /  \ \ \ \ \ \ _________________
    echo        /  \ \  / / / / / 
    echo   _ __/ /\ \ \/ /           monO$.AUTOLAUNCH
	
    echo;

    echo   -------------------------------------------
    echo   - LOADiNG LAST CONFiG iNTO RAM...
    echo   -------------------------------------------

    echo;

    TIMEOUT /T 10

    start /min "%LASTNAME%" /NORMAL "%LASTEXEC%" %LASTPARAMS%