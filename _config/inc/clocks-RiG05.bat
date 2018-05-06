@echo off

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                       ::
::                                                                          M i N E R  //  S E T U P     ::
::                                                                                                       ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::: ------------------------------------------------------------------------------------------------------
:::                                                                      CLOCKS // DAGGER / EQUIHASH
::: ------------------------------------------------------------------------------------------------------

::: SiNGLEMiNiNG

SET DUALCCLOCK=1150
SET DUALCVDDC=900
SET DUALMCLOCK=2100
SET DUALMVDDC=925
SET DUALPOWLIM=30

SET DCRI=10

::: DUALMiNiNG

IF "%MODE%"=="0" (

SET DUALCCLOCK=1250
SET DUALCVDDC=900
SET DUALMCLOCK=2100
SET DUALMVDDC=925
SET DUALPOWLIM=30

)

::: ------------------------------------------------------------------------------------------------------
:::                                                                             CLOCKS // CRYPTONIGHT
::: ------------------------------------------------------------------------------------------------------

SET GPUCCLOCK=1300
SET GPUCVDDC=975
SET GPUMCLOCK=2000
SET GPUMVDDC=925
SET GPUPOWLIM=0

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                       ::
::   E O F !                                                                                             ::
::                                                                                                       ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::