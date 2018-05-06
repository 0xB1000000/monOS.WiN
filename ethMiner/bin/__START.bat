@echo off

    call ..\..\_config\setup.bat

    setx GPU_FORCE_64BIT_PTR 0 > nul 2>&1
    setx GPU_MAX_HEAP_SIZE 100 > nul 2>&1
    setx GPU_USE_SYNC_OBJECTS 1 > nul 2>&1
    setx GPU_MAX_ALLOC_PERCENT 100 > nul 2>&1
    setx GPU_SINGLE_ALLOC_PERCENT 100 > nul 2>&1

    SETX LASTNAME "ethMiner" > nul 2>&1
    SETX LASTEXEC "C:\Apps\Crypto\Miners\ethMiner\bin\ethminer.exe" > nul 2>&1

    cls

    echo;

    echo   _ __          
    echo       \ \/ / /\ \
    echo        \  / /  \ \ \ \ \ \ _________________
    echo        /  \ \  / / / / / 
    echo   _ __/ /\ \ \/ /            ETHMiNER @ %WORKER%
	
    echo;

    echo   -------------------------------------------
    echo   - WHAT DO U WANT TO MiNE TODAY? ;)
    echo   -------------------------------------------
    echo   - [0]  ETH @ eth.nanopool.org
    echo   - [1]  ETH @ ethermine.org
    echo   - [2]  ETC @ etc.ethermine.org
    echo   - [3]  MUS @ mc.minecrypto.pro
    echo   - [3]  ELL @ pool.ellaism.org
    echo   - [4]  ETP @ uk.metaverse.farm
    echo   - [6]  EXP @ expmine.pro
    echo   - [7]  UBQ @ ubiq.hodlpool.com
    echo   - [8] PIRL @ pirl.minerpool.net
    echo   -------------------------------------------
    echo   - GPU: %GPU%
    echo   -------------------------------------------

    echo;

    set /p Coin= --^> CHOOSE YOUR DESTiNY: 

    echo;

    if '%Coin%'=='0' goto ETHNANO
    if '%Coin%'=='1' goto ETH
    if '%Coin%'=='2' goto ETC
    if '%Coin%'=='3' goto MUSIC
    if '%Coin%'=='4' goto ELLA
    if '%Coin%'=='5' goto ETP
    if '%Coin%'=='6' goto EXP
    if '%Coin%'=='7' goto UBQ
    if '%Coin%'=='8' goto PIRL

    :ETHNANO

    SETX LASTPARAMS "-HWMON -RH --farm-recheck 200 -%PLATFORM% -S eth-eu1.nanopool.org:9999 -O %ETHWALLET%.%WORKER%/%MAIL%:x" > nul 2>&1

    goto launch

    :ETH

    SETX LASTPARAMS "-HWMON -RH --farm-recheck 200 -%PLATFORM% -S eu1.ethermine.org:5555 -O %ETHWALLET%.%WORKER%ETH:x" > nul 2>&1

    goto launch

    :ETC

    SETX LASTPARAMS "-HWMON -RH --farm-recheck 200 -%PLATFORM% -S eu1-etc.ethermine.org:5555 -O %ETCWALLET%.%WORKER%ETH:x" > nul 2>&1

    goto launch

    :MUSIC

    SETX LASTPARAMS "-HWMON -RH --farm-recheck 200 -%PLATFORM% -S mc.minecrypto.pro:7007 -O %MUSWALLET%.%WORKER%ETH:x -SP 1" > nul 2>&1

    goto launch

    :ELLA

    SETX LASTPARAMS "-HWMON -RH --farm-recheck 200 -%PLATFORM% -S pool.ellaism.org:8008 -O %ELLWALLET%.%WORKER%ETH:x" > nul 2>&1

    goto launch

    :ETP

    SETX LASTPARAMS "-HWMON -RH --farm-recheck 200 -%PLATFORM% -S uk.metaverse.farm:3334 -O %ETPWALLET%.%WORKER%ETH:x" > nul 2>&1

    goto launch

    :EXP

    SETX LASTPARAMS "-HWMON -RH --farm-recheck 200 -%PLATFORM% -S eu.expmine.pro:9009 -O %EXPWALLET%.%WORKER%ETH:x" > nul 2>&1

    goto launch

    :UBQ

    SETX LASTPARAMS "-HWMON -RH --farm-recheck 200 -%PLATFORM% -S ubiq.hodlpool.com:8009 -O %UBQWALLET%.%WORKER%ETH:x" > nul 2>&1

    goto launch

    :PIRL

    SETX LASTPARAMS "-HWMON -RH --farm-recheck 200 -%PLATFORM% -S lb.geo.pirlpool.eu:8002 -O %PIRLWALLET%.%WORKER%ETH:x" > nul 2>&1

    goto launch

    :launch

    call ..\_config\_refreshEnv.cmd

    start %LAUNCHPARAMS% "%LASTNAME%" /NORMAL "%LASTEXEC%" %LASTPARAMS%