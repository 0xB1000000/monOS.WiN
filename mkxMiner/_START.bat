@echo off

    call ..\_config\setup.bat

    IF EXIST "..\_config\inc\clocks-%WORKER%.bat" (
      call ..\_config\inc\clocks-%WORKER%.bat
    )

    echo.%GPU% | FIND /I "Radeon">Nul && ( set PLATFORM=AMD ) || ( goto unsupported )

    setx GPU_FORCE_64BIT_PTR 0 > nul 2>&1
    setx GPU_MAX_HEAP_SIZE 100 > nul 2>&1
    setx GPU_USE_SYNC_OBJECTS 1 > nul 2>&1
    setx GPU_MAX_ALLOC_PERCENT 100 > nul 2>&1

    SETX LASTNAME "mkxMiner" > nul 2>&1

    cls

    echo;

    echo   _ __          
    echo       \ \/ / /\ \
    echo        \  / /  \ \ \ \ \ \ _________________
    echo        /  \ \  / / / / / 
    echo   _ __/ /\ \ \/ /           MKXMiNER @ %WORKER%

    echo;

    echo   -------------------------------------------
    echo   - WHAT DO U WANT TO MiNE TODAY? ;)
    echo   -------------------------------------------
    echo   - [0] XVG @ zpool.ca
    echo   - [1] XVG @ suprnova.cc
    echo   - [2] VTC @ suprnova.cc
    echo   - [3] MON @ suprnova.cc
    echo   -------------------------------------------
    echo   - GPU: %GPU%
    echo   -------------------------------------------

    echo;

    set /p Coin= --^> CHOOSE YOUR DESTiNY: 

    if %Coin%==0 goto 0
    if %Coin%==1 goto 1
    if %Coin%==2 goto 2
    if %Coin%==3 goto 3

    echo;


    :0

    SETX LASTEXEC "C:\Apps\Crypto\Miners\mkxMiner\mkxminer.exe --asm -o stratum+tcp://lyra2v2.mine.zpool.ca:4533 -u %XVGWALLET% -p c=XVG -I %MKINTENSITY% --powertune %MKPOWTUNE%" > nul 2>&1

    call ..\_config\_refreshEnv.cmd

    start %LAUNCHPARAMS% "mkxMiner // XVG Verge" %LASTEXEC%

    exit

    :1

    SETX LASTEXEC "C:\Apps\Crypto\Miners\mkxMiner\mkxminer.exe --asm -o stratum+tcp://xvg-lyra.suprnova.cc:2595 -u %SUPRNOVALOGIN%.%SUPRNOVAWORKER% -p x -I %MKINTENSITY% --powertune %MKPOWTUNE%" > nul 2>&1

    call ..\_config\_refreshEnv.cmd

    start %LAUNCHPARAMS% "mkxMiner // XVG Verge" %LASTEXEC%

    exit

    :2

    SETX LASTEXEC "C:\Apps\Crypto\Miners\mkxMiner\mkxminer.exe --asm -o stratum+tcp://vtc.suprnova.cc:5676 -u %SUPRNOVALOGIN%.%SUPRNOVAWORKER% -p x -I %MKINTENSITY% --powertune %MKPOWTUNE% --engine %MKENGINE% --memclock %MKMEMCLOCK" > nul 2>&1

    call ..\_config\_refreshEnv.cmd

    start %LAUNCHPARAMS% "mkxMiner // VTC VertCoin" %LASTEXEC%

    exit

    :3

    SETX LASTEXEC "C:\Apps\Crypto\Miners\mkxMiner\mkxminer.exe --asm -o stratum+tcp://mona.suprnova.cc:2995 -u %SUPRNOVALOGIN%.%SUPRNOVAWORKER% -p x -I %MKINTENSITY% --powertune %MKPOWTUNE% --engine %MKENGINE% --memclock %MKMEMCLOCK" > nul 2>&1

    call ..\_config\_refreshEnv.cmd

    start %LAUNCHPARAMS% "mkxMiner // MON MonaCoin" %LASTEXEC%

    exit

    :unsupported

    echo Sorry... GPU not supported!

    pause

    exit