@echo off

    echo;

    echo   _ __          
    echo       \ \/ / /\ \
    echo        \  / /  \ \ \ \ \ \ _________________
    echo        /  \ \  / / / / / 
    echo   _ __/ /\ \ \/ /            ETHASH MiNER
	
    echo;

    echo   -------------------------------------------
    echo   - WHAT DO U WANT TO MiNE TODAY?
    echo   -------------------------------------------
    echo   - [1]  ETH (ETHEREUM)
    echo   - [2]  ETC (ETHEREUM CLASSiC)
    echo   - [3]  CLO (CALLiSTO)
    echo   - [4]  ETP (METAVERSE)
    echo   - [5]  EXP (EXPANSE)
    echo   - [6]  MUS (MUSiCOiN)
    echo   - [7]  UBQ (UBiQ)
    echo   - [8] PIRL (PiRL)
    echo   - [9] ELLA (ELLAiSM)
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
    echo   _ __/ /\ \ \/ /            ETHASH MiNER

    echo;

    echo   -------------------------------------------
    echo   - PiCK A POOL!
    echo   -------------------------------------------

    if '%Coin%'=='1' goto ETH
    if '%Coin%'=='2' goto ETC
    if '%Coin%'=='3' goto CLO
    if '%Coin%'=='4' goto ETP
    if '%Coin%'=='5' goto EXP
    if '%Coin%'=='6' goto MUSIC
    if '%Coin%'=='7' goto UBQ
    if '%Coin%'=='8' goto PIRL
    if '%Coin%'=='9' goto ELLA

    :ETH

    setx Symbol "ETH" > nul 2>&1

    echo   - [1] eth.nanopool.org
    echo   - [2] ethermine.org
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    set /p Pool= --^> CHOOSE YOUR DESTiNY: 

    echo;

    goto LAUNCH

    :ETC

    setx Symbol "ETC" > nul 2>&1

    echo   - [1] etc.ethermine.org
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    set /p Pool= --^> CHOOSE YOUR DESTiNY: 

    echo;

    goto LAUNCH

    :CLO

    setx Symbol "CLO" > nul 2>&1

    echo   - [1] clopool.pro
    echo   - [2] callistopool.io
    echo   - [3] callistopool.org
    echo   - [4] pool.baikalmine.com
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    set /p Pool= --^> CHOOSE YOUR DESTiNY: 

    echo;

    goto LAUNCH

    :ETP

    setx Symbol "ETP" > nul 2>&1

    echo   - [1] uk.metaverse.farm
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    set /p Pool= --^> CHOOSE YOUR DESTiNY: 

    echo;

    goto LAUNCH

    :EXP

    setx Symbol "EXP" > nul 2>&1

    echo   - [1] expmine.pro
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    set /p Pool= --^> CHOOSE YOUR DESTiNY: 

    echo;

    goto LAUNCH

    :MUSIC

    setx Symbol "MUSIC" > nul 2>&1

    echo   - [1] mc.minecrypto.pro
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    set /p Pool= --^> CHOOSE YOUR DESTiNY: 

    echo;

    goto LAUNCH

    :UBQ

    setx Symbol "UBQ" > nul 2>&1

    echo   - [1] ubiq.hodlpool.com
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    set /p Pool= --^> CHOOSE YOUR DESTiNY: 

    echo;

    goto LAUNCH

    :PIRL

    setx Symbol "PIRL" > nul 2>&1

    echo   - [1] pirl.minerpool.net
    echo   - [2] pool.baikalmine.com
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    set /p Pool= --^> CHOOSE YOUR DESTiNY: 

    echo;

    goto LAUNCH

    :ELLA

    setx Symbol "ELLA" > nul 2>&1

    echo   - [1] pool.ellaism.org
    echo   - [2] pool.baikalmine.com
    echo   -------------------------------------------
    echo   - SYS: %WORKER% / %GPU%
    echo   -------------------------------------------

    echo;

    set /p Pool= --^> CHOOSE YOUR DESTiNY: 

    echo;

    goto LAUNCH