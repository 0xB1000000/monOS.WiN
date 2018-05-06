@echo off

    call ..\_config\setup.bat

    IF EXIST "..\_config\inc\clocks-%WORKER%.bat" (
      call ..\_config\inc\clocks-%WORKER%.bat
    )

    echo.%GPU% | FIND /I "Radeon">Nul && (set PLATFORM=AMD) || (set PLATFORM=NVIDIA)

    setx GPU_FORCE_64BIT_PTR 0 > nul 2>&1
    setx GPU_MAX_HEAP_SIZE 100 > nul 2>&1
    setx GPU_USE_SYNC_OBJECTS 1 > nul 2>&1
    setx GPU_MAX_ALLOC_PERCENT 100 > nul 2>&1
    setx GPU_SINGLE_ALLOC_PERCENT 100 > nul 2>&1

    cls

    IF "%LASTRUN%"=="PHOENIX" IF EXIST "config-%WORKER%.txt" (

    echo;

    echo   _ __
    echo       \ \/ / /\ \
    echo        \  / /  \ \ \ \ \ \ _________________
    echo        /  \ \  / / / / / 
    echo   _ __/ /\ \ \/ /            ETHASH MiNER

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

    call ..\Claymore.Dual.Miner\_POOLS.bat

    :LAUNCH

    IF "%RIGTYPE%"=="1" IF EXIST "..\Claymore.Dual.Miner\pool-%Coin%%Pool%-1.txt" (

        type settings.txt ..\Claymore.Dual.Miner\pool-%Coin%%Pool%-1.txt > config-%WORKER%.txt
        goto START

    )

    type settings.txt ..\Claymore.Dual.Miner\pool-%Coin%%Pool%.txt > config-%WORKER%.txt

    :START

    cls

    SETX LASTNAME "PhoenixMiner" > nul 2>&1
    SETX LASTEXEC "C:\Apps\Crypto\Miners\PhoenixMiner\PhoenixMiner.exe" > nul 2>&1
    SETX LASTPARAMS "config-%WORKER%.txt" > nul 2>&1

    SETX LASTRUN "PHOENIX" > nul 2>&1

    call ..\_config\_refreshEnv.cmd

    start %LAUNCHPARAMS% "%LASTNAME%" /NORMAL %LASTEXEC% %LASTPARAMS%

    cls