@echo off

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                       ::
::                                                                          M i N E R  //  S E T U P     ::
::                                                                                                       ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

::: 6x XFX RADEON RX580 XXX / 8GB / SAMSUNG

::: ------------------------------------------------------------------------------------------------------
:::                                                                      CLOCKS // DAGGER / EQUIHASH
::: ------------------------------------------------------------------------------------------------------

::: SiNGLEMiNiNG

SET DUALCCLOCK=1150
SET DUALCVDDC=875
SET DUALMCLOCK=2050
SET DUALMVDDC=925
SET DUALPOWLIM=0

SET DCRI=10

::: DUALMiNiNG

IF "%MODE%"=="0" (

SET DUALCCLOCK=1200
SET DUALCVDDC=900
SET DUALMCLOCK=2000
SET DUALMVDDC=925
SET DUALPOWLIM=20

)

::: ------------------------------------------------------------------------------------------------------
:::                                                                            CLOCKS // CRYPTONIGHT
::: ------------------------------------------------------------------------------------------------------

SET GPUCCLOCK=1350
SET GPUCVDDC=975
SET GPUMCLOCK=2000
SET GPUMVDDC=925
SET GPUPOWLIM=20

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::                                                                                                       ::
::   E O F !                                                                                             ::
::                                                                                                       ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::