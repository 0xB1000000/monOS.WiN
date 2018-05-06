@echo off

    call ..\_config\setup.bat

    IF EXIST "..\_config\inc\clocks-%WORKER%.bat" (
      call ..\_config\inc\clocks-%WORKER%.bat
    )

    echo.%GPU% | FIND /I "Radeon">Nul && ( set PLATFORM=AMD ) || ( goto unsupported )

    setx GPU_FORCE_64BIT_PTR 1 > nul 2>&1
    setx GPU_MAX_HEAP_SIZE 100 > nul 2>&1
    setx GPU_USE_SYNC_OBJECTS 1 > nul 2>&1
    setx GPU_MAX_ALLOC_PERCENT 100 > nul 2>&1
    setx GPU_SINGLE_ALLOC_PERCENT 100 > nul 2>&1

    cls

    IF "%LASTRUN%"=="NEOSCRYPT" IF EXIST "config-%WORKER%.txt" (

    echo;

    echo   _ __
    echo       \ \/ / /\ \
    echo        \  / /  \ \ \ \ \ \ _________________
    echo        /  \ \  / / / / / 
    echo   _ __/ /\ \ \/ /           NEOSCRYPT MiNER

    echo;

    echo   -------------------------------------------
    echo   - CONTiNUE MiNiNG %Symbol%?
    echo   -------------------------------------------
    echo   - [0] NO
    echo   - [1] YES
    echo   -------------------------------------------

    echo;

    set /p ContinueLastRun= --^> CHOOSE YOUR DESTiNY: 

    echo;

    )

    if '%ContinueLastRun%'=='1' goto START

    cls

    echo;

    echo   _ __          
    echo       \ \/ / /\ \
    echo        \  / /  \ \ \ \ \ \ _________________
    echo        /  \ \  / / / / / 
    echo   _ __/ /\ \ \/ /           NEOSCRYPT MiNER

    echo;

    echo   -------------------------------------------
    echo   - WHAT DO U WANT TO MiNE TODAY?
    echo   -------------------------------------------
    echo   - [1] TZC (TREZARCOiN)
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    set /p Coin= --^> CHOOSE YOUR DESTiNY: 

    echo;

    cls

    echo;

    echo   _ __          
    echo       \ \/ / /\ \
    echo        \  / /  \ \ \ \ \ \ _________________
    echo        /  \ \  / / / / / 
    echo   _ __/ /\ \ \/ /           NEOSCRYPT MiNER

    echo;

    echo   -------------------------------------------
    echo   - PiCK A POOL
    echo   -------------------------------------------

    if '%Coin%'=='1' goto TZC

    :TZC

    setx Symbol "TZC" > nul 2>&1

    echo   - [1] pool.trezarcoin.com
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    set /p Pool= --^> CHOOSE YOUR DESTiNY: 

    echo;

    goto LAUNCH

    :LAUNCH

    IF "%RIGTYPE%"=="1" IF EXIST "pool-%Coin%%Pool%-1.txt" (

        type pool-%Coin%%Pool%-1.txt settings.txt > config-%WORKER%.txt
        goto START

    )

    type pool-%Coin%%Pool%.txt settings.txt > config-%WORKER%.txt

    :START

    cls

    call ..\_config\_refreshEnv.cmd

    SETX LASTNAME "%Symbol% NEOSCRYPT GPUMiner" > nul 2>&1
    SETX LASTEXEC "C:\Apps\Crypto\Miners\Claymore.NS.GPU.Miner\NeoScryptMiner.exe" > nul 2>&1
    SETX LASTPARAMS "config-%WORKER%.txt" > nul 2>&1

    SETX LASTRUN "NEOSCRYPT" > nul 2>&1

    call ..\_config\_refreshEnv.cmd

    start %LAUNCHPARAMS% "%LASTNAME%" /NORMAL %LASTEXEC% %LASTPARAMS%

    exit

    cls

    :unsupported

    echo Sorry... GPU not supported!

    pause

    exit