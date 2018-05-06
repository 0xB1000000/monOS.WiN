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

    IF "%LASTRUN%"=="EQUIHASH" IF EXIST "config-%WORKER%.txt" (

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
    echo   _ __/ /\ \ \/ /            EQUiHASH MiNER

    echo;

    echo   -------------------------------------------
    echo   - WHAT DO U WANT TO MiNE TODAY?
    echo   -------------------------------------------
    echo   - [1]  ZEC (ZCASH)
    echo   - [2]  ZCL (ZCLASSiC)
    echo   - [3]  BTG (BiTCOiN GOLD)
    echo   - [4] BTCP (BiTCOiN PRiVATE)
    echo   - [5] BTCZ (BiTCOiN Z)
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
    echo   _ __/ /\ \ \/ /            EQUiHASH MiNER

    echo;

    echo   -------------------------------------------
    echo   - PiCK A POOL
    echo   -------------------------------------------

    if '%Coin%'=='1' goto ZEC
    if '%Coin%'=='2' goto ZCL
    if '%Coin%'=='3' goto BTG
    if '%Coin%'=='4' goto BTCP
    if '%Coin%'=='5' goto BTCZ

    :ZEC

    setx Symbol "ZEC" > nul 2>&1

    echo   - [1] zec.nanopool.org
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    set /p Pool= --^> CHOOSE YOUR DESTiNY: 

    echo;

    goto LAUNCH

    :ZCL

    setx Symbol "ZCL" > nul 2>&1

    echo   - [1] zclmine.pro
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    set /p Pool= --^> CHOOSE YOUR DESTiNY: 

    echo;

    goto LAUNCH

    :BTG

    setx Symbol "BTG" > nul 2>&1

    echo   - [1] eu.btgpool.pro
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    set /p Pool= --^> CHOOSE YOUR DESTiNY: 

    echo;

    goto LAUNCH

    :BTCP

    setx Symbol "BTCP" > nul 2>&1

    echo   - [1] eu.btcprivate.pro
    echo   - [2] pool.btcprivate.org
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    set /p Pool= --^> CHOOSE YOUR DESTiNY: 

    echo;

    goto LAUNCH

    :BTCZ

    setx Symbol "BTCZ" > nul 2>&1

    echo   - [1] btcz.altpool.pro
    echo   - [2] btcz.suprnova.cc
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    set /p Pool= --^> CHOOSE YOUR DESTiNY: 

    echo;

    IF "%Pool%"=="2" IF "%SUPRNOVALOGIN%"=="" (

    cls

    echo;

    echo   _ __          
    echo       \ \/ / /\ \
    echo        \  / /  \ \ \ \ \ \ _________________
    echo        /  \ \  / / / / / 
    echo   _ __/ /\ \ \/ /            EQUiHASH MiNER

    echo;

    echo   -------------------------------------------
    echo   - [91mE R R O R ! ! ![0m
    echo   -------------------------------------------
    echo   - NO VALiD SUPRNOVA LOGiN FOUND
    echo   - PLEASE CHECK SETUP.BAT
    echo   - USiNG POOL1 AS FALLBACK
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    TIMEOUT /T 10

    SET Pool=1

    )

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

    SETX LASTNAME "%Symbol% EQUiHASH GPUMiner" > nul 2>&1
    SETX LASTEXEC "C:\Apps\Crypto\Miners\Claymore.ZCash.Miner\ZecMiner64.exe" > nul 2>&1
    SETX LASTPARAMS "config-%WORKER%.txt" > nul 2>&1

    SETX LASTRUN "EQUIHASH" > nul 2>&1

    call ..\_config\_refreshEnv.cmd

    start %LAUNCHPARAMS% "%LASTNAME%" /NORMAL %LASTEXEC% %LASTPARAMS%

    exit

    cls

    :unsupported

    echo Sorry... GPU not supported!

    pause

    exit