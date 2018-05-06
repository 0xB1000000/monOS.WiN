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

    IF "%LASTRUN%"=="DUAL" IF EXIST "config-%WORKER%.txt" (

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

    call _POOLS.bat

    :LAUNCH

    IF "%RIGTYPE%"=="1" IF EXIST "pool-%Coin%%Pool%-1.txt" (

        type settings.txt pool-%Coin%%Pool%-1.txt > config-%WORKER%.txt
        goto continue1

    )

    type settings.txt pool-%Coin%%Pool%.txt > config-%WORKER%.txt

    :continue1

    cls

    echo;

    echo   _ __          
    echo       \ \/ / /\ \
    echo        \  / /  \ \ \ \ \ \ _________________
    echo        /  \ \  / / / / / 
    echo   _ __/ /\ \ \/ /            ETHASH MiNER
	
    echo;

    echo   -------------------------------------------
    echo   - ENABLE DUALMiNiNG MODE?
    echo   -------------------------------------------
    echo   - [0] NO
    echo   - [1] YES
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    set /p MODE= --^> CHOOSE YOUR DESTiNY: 

    IF "%MODE%"=="0" SET MODE=1 goto continue2
    IF "%MODE%"=="1" SET MODE=0

    :continue2

    cls

    IF "%MODE%"=="0" (

    echo;

    echo   _ __          
    echo       \ \/ / /\ \
    echo        \  / /  \ \ \ \ \ \ _________________
    echo        /  \ \  / / / / / 
    echo   _ __/ /\ \ \/ /            ETHASH MiNER
	
    echo;

    echo   -------------------------------------------
    echo   - PiCK AN ALTCOiN!
    echo   -------------------------------------------
    echo   - [1]  SIA @ sia.nanopool.org
    echo   - [2]  XVG @ ethermine.org
    echo   - [3]  MAX @ maxcoin.miningpoolhub.com
    echo   - [4] PASC @ pasc.nanopool.org
    echo   -------------------------------------------

    echo;

    set /p AltCoin= --^> CHOOSE YOUR DESTiNY: 

    echo;

    )

    IF "%MODE%"=="0" IF "%RIGTYPE%"=="1" IF EXIST "pool-%Coin%%Pool%-1.txt" (

        type settings.txt pool-%Coin%%Pool%-1.txt poolalt-%AltCoin%.txt > config-%WORKER%.txt
        goto START

    )

    IF "%MODE%"=="0" (

        type settings.txt pool-%Coin%%Pool%.txt poolalt-%AltCoin%.txt > config-%WORKER%.txt

    )

    :START

    cls

    call ..\_config\_refreshEnv.cmd

    SETX LASTNAME "%Symbol% ETHASH DualMiner" > nul 2>&1
    SETX LASTEXEC "C:\Apps\Crypto\Miners\Claymore.Dual.Miner\EthDcrMiner64.exe" > nul 2>&1
    SETX LASTPARAMS "config-%WORKER%.txt" > nul 2>&1

    SETX LASTRUN "DUAL" > nul 2>&1

    call ..\_config\_refreshEnv.cmd

    start %LAUNCHPARAMS% "%LASTNAME%" /NORMAL %LASTEXEC% %LASTPARAMS%

    cls