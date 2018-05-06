@echo off

    cd _config
    ren example-setup.bat setup.bat > nul 2>&1
    cd..

    call _config\setup.bat

    FOR /F "tokens=2 delims==" %%a IN ('wmic os get OSLanguage /Value') DO set INSTLANG=%%a
 
    echo;

    echo   _ __          
    echo       \ \/ / /\ \
    echo        \  / /  \ \ \ \ \ \ _________________
    echo        /  \ \  / / / / / 
    echo   _ __/ /\ \ \/ /           monO$.iNSTALLER

    echo;

    IF '%INSTLANG%'=='1031' (

    echo   -------------------------------------------
    echo   - W i L L K O M M E N
    echo   -------------------------------------------
    echo   - [1] iNSTALLATION NACH C:\APPS\CRYPTO\
    echo   - [2] UPDATE / KONFiG FiLES BEHALTEN

    )

    IF '%INSTLANG%'=='1033' (

    echo   -------------------------------------------
    echo   - W E L C O M E
    echo   -------------------------------------------
    echo   - [1] CLEAN iNSTALL TO C:\APPS\CRYPTO\
    echo   - [2] UPDATE / KEEP CONFiG FiLES

    )

    echo   - [3] EXIT
    echo   -------------------------------------------
    echo   - CPU: %CPU%
    echo   -------------------------------------------

    echo;

    set /p OPTION= --^> CHOOSE YOUR DESTiNY: 

    echo;

    if '%OPTION%'=='1' goto INSTALL
    if '%OPTION%'=='2' goto UPDATE
    if '%OPTION%'=='3' goto QUIT

    :INSTALL

    xcopy.exe *.* C:\Apps\Crypto\Miners\ /E /C /I /H /K /Y /EXCLUDE:_config\_exclude.txt

    copy _shortcuts\*.lnk %userprofile%\desktop

    IF '%INSTLANG%'=='1031' (

      copy _launcher\*.lnk "%userprofile%\AppData\Roaming\Microsoft\Windows\Startmenü\Programme\Autostart\"
      GOTO DONE

    )

    copy _launcher\*.lnk "%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"

    :DONE

    cls

    echo;

    echo   _ __          
    echo       \ \/ / /\ \
    echo        \  / /  \ \ \ \ \ \ _________________
    echo        /  \ \  / / / / / 
    echo   _ __/ /\ \ \/ /           monO$.iNSTALLER
	
    echo;

    IF '%INSTLANG%'=='1031' (

    echo   -------------------------------------------
    echo   - 
    echo   -             - F E R T i G -
    echo   - 
    echo   -          ALLE MiNER iNSTALLiERT
    echo   -         DESKTOP SYMBOLE ERSTELLT
    echo   -         AUTOLAUNCHER HINZUGEFÜGT
    echo   - 
    echo   -          LOS, COiNZZZ SCHÜRFEN!
    echo   - 
    echo   -------------------------------------------

    )

    IF '%INSTLANG%'=='1033' (

    echo   -------------------------------------------
    echo   - 
    echo   -               - D O N E -
    echo   - 
    echo   -          ALL MINERS INSTALLED
    echo   -        DESKTOP SHORTCUTS CREATED
    echo   -           AUTOLAUNCHER ADDED
    echo   - 
    echo   -          GO, MINE SOME COINZZZ!
    echo   - 
    echo   -------------------------------------------

    )

    echo;

    start notepad "C:\Apps\Crypto\Miners\_config\setup.bat"

    pause

    goto QUIT

    :UPDATE

    xcopy.exe *.* C:\Apps\Crypto\Miners\ /E /C /I /H /K /Y /EXCLUDE:_config\_exclude_update.txt

    cls

    echo;

    echo   _ __          
    echo       \ \/ / /\ \
    echo        \  / /  \ \ \ \ \ \ _________________
    echo        /  \ \  / / / / / 
    echo   _ __/ /\ \ \/ /            monO$.UPDATER
	
    echo;

    IF '%INSTLANG%'=='1031' (

    echo   -------------------------------------------
    echo   - 
    echo   -             - F E R T i G -
    echo   - 
    echo   -          ALLE MiNER AKTUALiSiERT
    echo   -           LOS, COiNZ SCHÜRFEN!
    echo   - 
    echo   -------------------------------------------

    )

    IF '%INSTLANG%'=='1033' (

    echo   -------------------------------------------
    echo   - 
    echo   -               - D O N E -
    echo   - 
    echo   -            ALL MINERS UPDATED
    echo   -          GO, MINE SOME COINZZZ!
    echo   - 
    echo   -------------------------------------------

    )

    echo;

    pause

    goto QUIT

    :QUIT

    exit