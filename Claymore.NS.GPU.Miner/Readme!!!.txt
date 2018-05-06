Claymore's NeoScrypt AMD GPU Miner.
=========================

WARNING: NeoScrypt algorithm is VERY HOT, make sure you have powerful PSU and good GPU cooling, use "-powlim 50" option to get full hashrate.

LINKS:

GOOGLE:  https://drive.google.com/open?id=1j7mhliKrRS2IWp_lMrNfhRBAeJT7ISIu
MEGA:    https://mega.nz/#F!WthSUArb!00pET54lyIF1386tOGs1BQ


This is POOL version. Use any recent drivers. Miner requires up to 1.1GB of GPU memory.
For multi-GPU systems, set Virtual Memory size in Windows at least 16 GB (better more):
"Computer Properties / Advanced System Settings / Performance / Advanced / Virtual Memory".

This miner is free-to-use, however, current developer fee is 2%, every hour the miner mines for 72 seconds for developer.
If you don't agree with the dev fee - don't use this miner, or use "-nofee" option.
Attempts to cheat and remove dev fee will cause a bit slower mining speed (same as "-nofee 1") though miner will show same hashrate. 
Miner cannot just stop if cheat is detected because creators of cheats would know that the cheat does not work and they would find new tricks. If miner does not show any errors or slowdowns, they are happy.

This miner is heavily optimized and therefore supports only most popular AMD GPU chips: Pitcairn, Tahiti, Hawaii, Tonga, Fiji, Ellesmere, Baffin, Vega.

Only Windows x64 is supported currently. No Linux support. No 32-bit support. No NVidia support.



COMMAND LINE OPTIONS:

-pool 	NeoScrypt pool address. Only Stratum protocol is supported.

-wal 	Your wallet address. Also worker name and other options if pool supports it. 

-psw 	Password for NeoScrypt pool, use "x" as password, and/or any other options if pool supports them.

-a	algorithm mode for Ellesmere cards (RX470/RX480/RX570/RX580 cards), for other cards always "-a 1" is used. You can specify "-a 1" (default) or "-a 2" and find the best hashrate for your card.
	You can also set this option for every card individually, for example "-a 1,2,1".

-di 	GPU indexes, default is all available GPUs. For example, if you have four GPUs "-di 02" will enable only first and third GPUs (#0 and #2).
	You can also turn on/off cards in runtime with "0"..."9" keys and check current statistics with "s" key.
	For systems with more than 10 GPUs: use letters to specify indexes more than 9, for example, "a" means index 10, "b" means index 11, etc; also "a", "b", and "c" keys allow you to turn on/off GPU #10, #11 and #12 in runtime.

-ftime	failover main pool switch time, in minutes, see "Failover" section below. Default value is 30 minutes, set zero if there is no main pool.

-wd 	watchdog option. Default value is "-wd 1", it enables watchdog, miner will be closed (or restarted, see "-r" option) if any thread is not responding for 1 minute or OpenCL call failed.
	Specify "-wd 0" to disable watchdog.

-r	Restart miner mode. "-r 0" (default) - restart miner if something wrong with GPU. "-r -1" - disable automatic restarting. -r >20 - restart miner if something 
	wrong with GPU or by timer. For example, "-r 60" - restart miner every hour or when some GPU failed.
	"-r 1" closes miner and execute "reboot.bat" file ("reboot.bash" or "reboot.sh" for Linux version) in the miner directory (if exists) if some GPU failed. 
	So you can create "reboot.bat" file and perform some actions, for example, reboot system if you put this line there: "shutdown /r /t 5 /f".

-minspeed	minimal speed, in KH/s. If miner cannot reach this speed for 5 minutes for any reason, miner will be restarted (or "reboot.bat" will be executed if "-r 1" is set). Default value is 0 (feature disabled).
	You can also specify negative values if you don't want to restart miner due to pool connection issues; for example, "-minspeed -3000" will restart miner only if it cannot reach 3Mh/s at good pool connection.

-retrydelay	delay, in seconds, between connection attempts. Default values is "20". Specify "-retrydelay -1" if you don't need reconnection, in this mode miner will exit if connection is lost.

-dbg	debug log and messages. "-dbg 0" - (default) create log file but don't show debug messages. 
	"-dbg 1" - create log file and show debug messages. "-dbg -1" - no log file and no debug messages.

-logfile	debug log file name. After restart, miner will append new log data to the same file. If you want to clear old log data, file name must contain "noappend" string.
	If missed, default file name will be used.

-logsmaxsize	maximal size of debug log files, in MB. At every start the miner checks all files in its folder, selects all files that contain "_log.txt" string and removes oldest files if summary files size is larger than specified value. 
	Specify "-logsmaxsize 0" to cancel old logs removal. Default value is 1000 (i.e. about 1GB of log files are allowed).

-nofee	set "1" to cancel my developer fee at all. In this mode some optimizations are disabled so mining speed will be slower by about 5%. 
	By enabling this mode, I will lose 100% of my earnings, you will lose only 3% of your earnings.
	So you have a choice: "fastest miner" or "completely free miner but a bit slower".
	If you want both "fastest" and "completely free" you should find some other miner that meets your requirements, just don't use this miner instead of claiming that I need 
	to cancel/reduce developer fee, saying that 2% developer fee is too much for this miner and so on.

-benchmark	benchmark mode, specify "-benchmark 1" to see hashrate for your hardware.

-li	low intensity mode. Reduces mining intensity, useful if your cards are overheated. Note that mining speed is reduced too. 
	More value means less heat and mining speed, for example, "-li 10" is less heat and mining speed than "-li 1". You can also specify values for every card, for example "-li 3,10,50".
	Default value is "0" - no low intensity mode.

-tt	set target GPU temperature. For example, "-tt 80" means 80C temperature. You can also specify values for every card, for example "-tt 70,80,75".
	You can also set static fan speed if you specify negative values, for example "-tt -50" sets 50% fan speed. Specify zero to disable control and hide GPU statistics.
	"-tt 1" (default) does not manage fans but shows GPU temperature and fan status every 30 seconds. Specify values 2..5 if it is too often.

-ttli	reduce entire mining intensity (for all coins) automatically if GPU temperature is above specified value. For example, "-ttli 80" reduces mining intensity if GPU temperature is above 80C.
	You can see if intensity was reduced in detailed statistics ("s" key).
	You can also specify values for every card, for example "-ttli 80,85,80". You also should specify non-zero value for "-tt" option to enable this option.
	It is a good idea to set "-ttli" value higher than "-tt" value by 3-5C.

-tstop	set stop GPU temperature, miner will stop mining if GPU reaches specified temperature. For example, "-tstop 95" means 95C temperature. You can also specify values for every card, for example "-tstop 95,85,90".
	This feature is disabled by default ("-tstop 0"). You also should specify non-zero value for "-tt" option to enable this option.
	If it turned off wrong card, it will close miner in 30 seconds.
	You can also specify negative value to close miner immediately instead of stopping GPU, for example, "-tstop -95" will close miner as soon as any GPU reach 95C temperature.

-fanmax	set maximal fan speed, in percents, for example, "-fanmax 80" will set maximal fans speed to 80%. You can also specify values for every card, for example "-fanmax 50,60,70".
	This option works only if miner manages cooling, i.e. when "-tt" option is used to specify target temperature. Default value is "100".

-fanmin	set minimal fan speed, in percents, for example, "-fanmin 50" will set minimal fans speed to 50%. You can also specify values for every card, for example "-fanmin 50,60,70".
	This option works only if miner manages cooling, i.e. when "-tt" option is used to specify target temperature. Default value is "0".

-cclock	set target GPU core clock speed, in MHz. If not specified or zero, miner will not change current clock speed. You can also specify values for every card, for example "-cclock 1000,1050,1100,0".
	Note: for some drivers versions AMD blocked underclocking for some reason, you can overclock only.
	Note: this option changes clocks for all power states, so check voltage for all power states in WattMan or use -cvddc option.  
	By default, low power states have low voltage, setting high GPU clock for low power states without increasing voltage can cause driver crash.

-mclock	set target GPU memory clock speed, in MHz. If not specified or zero, miner will not change current clock speed. You can also specify values for every card, for example "-mclock 1200,1250,1200,0".
	Note: for some drivers versions AMD blocked underclocking for some reason, you can overclock only.

-powlim set power limit, from -50 to 50. If not specified, miner will not change power limit. You can also specify values for every card, for example "-powlim 20,-20,0,10".

-cvddc	set target GPU core voltage, multiplied by 1000. For example, "-cvddc 1050" means 1.05V. You can also specify values for every card, for example "-cvddc 900,950,1000,970". Supports latest AMD 4xx cards only in Windows.

-mvddc	set target GPU memory voltage, multiplied by 1000. For example, "-mvddc 1050" means 1.05V. You can also specify values for every card, for example "-mvddc 900,950,1000,970". Supports latest AMD 4xx cards only in Windows.

-mport	remote monitoring/management port. Default value is -3333 (read-only mode), specify "-mport 0" to disable remote monitoring/management feature. 
	Specify negative value to enable monitoring (get statistics) but disable management (restart, uploading files), for example, "-mport -3333" enables port 3333 for remote monitoring, but remote management will be blocked.
	You can also use your web browser to see current miner state, for example, type "localhost:3333" in web browser. 
	Warning: use negative option value or disable remote management entirely if you think that you can be attacked via this port!
	By default, miner will accept connections on specified port on all network adapters, but you can select desired network interface directly, for example, "-mport 127.0.0.1:3333" opens port on localhost only.

-mpsw	remote monitoring/management password. By default it is empty, so everyone can ask statistics or manage miner remotely if "-mport" option is set. You can set password for remote access (at least EthMan v3.0 is required to support passwords).

-colors enables or disables colored text in console. Default value is "1", use "-colors 0" to disable coloring. Use 2...4 values to remove some of colors.

-v	displays miner version, sample usage: "-v 1".



CONFIGURATION FILE

You can use "config.txt" file instead of specifying options in command line. 
If there are not any command line options, miner will check "config.txt" file for options.
If there is only one option in the command line, it must be configuration file name.
If there are two or more options in the command line, miner will take all options from the command line, not from configuration file.
Place one option per line, if first character of a line is ";" or "#", this line will be ignored. 
You can also use environment variables in "pools.txt" and "config.txt" files. For example, define "WORKER" environment variable and use it as "%WORKER%" in config.txt or in pools.txt.



SAMPLE USAGE

miningpoolhub:

  NeoScryptMiner.exe -pool hub.miningpoolhub.com:20510 -wal Redhex.sample -psw x

nicehash:
  
  NeoScryptMiner.exe -pool stratum+tcp://neoscrypt.eu.nicehash.com:3341 -wal YourBtcWalletAddress -psw x



FAILOVER

Use "pools.txt" file to specify additional pools. This file has text format, one pool per line. Every pool has 3 connection attempts. 
Miner disconnects automatically if pool does not send new jobs for a long time or if pool rejects too many shares.
If the first character of a line is ";" or "#", this line will be ignored. 
Do not change spacing, spaces between parameters and values are required for parsing.
If you need to specify "," character in parameter value, use two commas - ,, will be treated as one comma.
You can reload "pools.txt" file in runtime by pressing "r" key.
Pool specified in the command line is "main" pool, miner will try to return to it every 30 minutes if it has to use some different pool from the list. 
If no pool was specified in the command line then first pool in the failover pools list is main pool.
You can change 30 minutes time period to some different value with "-ftime" option, or use "-ftime 0" to disable switching to main pool.
You can also use environment variables in "pools.txt" and "config.txt" files. For example, define "WORKER" environment variable and use it as "%WORKER%" in config.txt or in pools.txt.
You can also select current pool in runtime by pressing "e" key.



REMOTE MONITORING/MANAGEMENT

Miner supports remote monitoring/management via JSON protocol over raw TCP/IP sockets. You can also get recent console text lines via HTTP.
Start "EthMan.exe" from "Remote management" subfolder.
Check built-in help for more information. "API.txt" file contains more details about protocol.



KNOWN ISSUES

- Windows 10 Defender recognizes miner as a virus, some antiviruses do the same. Miner is not a virus, add it to Defender exceptions. 
  I write miners since 2014. Most of them are recognized as viruses by some paranoid antiviruses, perhaps because I pack my miners to protect them from disassembling, perhaps because some people include them into their botnets, or perhaps these antiviruses are not good, I don't know. For these years, a lot of people used my miners and nobody confirmed that my miner stole anything or did something bad. 
  Note that I can guarantee clean binaries only for official links in my posts on this forum (bitcointalk). If you downloaded miner from some other link - it really can be a virus.
  However, my miners are closed-source so I cannot prove that they are not viruses. If you think that I write viruses instead of good miners - do not use this miner, or at least use it on systems without any valuable data.



TROUBLESHOOTING

1. Install latest drivers.
2. Disable overclocking.
3. Set environment variables as described above.
4. Set Virtual Memory 16 GB.
5. Reboot computer.
6. Check hardware, risers.



FAQ

- What command option X means?
  Read "Readme!!!.txt", "COMMAND LINE OPTIONS" section.

- How to mine using pool X?
  Read "Readme!!!.txt", "SAMPLE USAGE" section.

- Windows 10 marks miner as a virus.
  Read "Readme!!!.txt", "KNOWN ISSUES" section.

- Can miner stop overheated GPU?
  Yes, see "-tstop" option.

- Why this command line doesn't work (escaping '&')?
  Char '&' in command line means command separator, to use it in command line either quote string with "", or escape '&' (use ^& on Windows).
  No need to do this in *pools.txt or config.txt.
  Also all command line options must be in same line in .bat file, don't split them to several lines, it won't work.

- Will newer drivers have higher/lower hashrate?
  Usually no, but it depends... Check for yourself.

- Why -cclock/-mclock options do not work?
  Sometimes they do not work. Use Afterburner or other tools.

- Can the temperature be lowered?
  Yes, see "-tt", "-dcri", "-ttdcr", "-li", "-ttli" options.

- I see only one card via Remote Desktop Connection.
  It's a problem of RDC, use TeamViewer or some other remote access software.

- I see only one card instead of two in temperature management info.
  Disable CrossFire, don't use Remote Desktop Connection.

- Error "server: bind failed with error".
  Specify "-mport 0" option.

- How can I get stats from miner as EthMan does?
  Check API.txt file for json protocol details.

- Miner freezes if I put cursor to its window in Windows 10 until any key is pressed. Sometimes miner freezes randomly until any key is pressed.
  You should make some changes in Windows:
  https://superuser.com/questions/555160/windows-command-prompt-freezing-on-focus
  https://superuser.com/questions/419717/windows-command-prompt-freezing-randomly?rq=1
  https://superuser.com/questions/1051821/command-prompt-random-pause?rq=1

- Sometimes miner cannot connect to devfee mining server at first attempt, does it cause longer devfee mining?
  No, during these connection attempts miner still mines for you. 

- How many cards are supported?
  Miner supports up to 32 GPUs.

- Miner crashed and I cannot restart it until reboot.
  Often when OpenCL fails, you have to reboot the system, not just restart miner. Sometimes even soft reboot won't work and you have to press Reset button. It is because the fail is at drivers level, Windows does not like such things and drivers too.

- EthMan loses rigs with 12 GPUs.
  Sometimes systems with 12 GPUs and low-end CPU become slow for remote access, you can see problems with EthMan and other remote management software.


FAQ #2:

1. If you think that the miner will mine even if you turn off the router, wait a couple of minutes more, it will stop.
2. Place all command line arguments in .BAT file in a single line. Arguments from the second line will be ignored.
3. I don't have any private versions with +50% speed.
4. I'm a software developer, so I think I cannot help you to build your mining rig properly or provide you with the list of necessary parts, please ask this question here on forum or search here, there are many threads related to hardware.
5. Please read Readme.txt or original post of this thread for command line samples, options description and FAQ.
6. I don't have miners for Tesla, IBM CPUs, Phi or for very old GPUs.
7. Mining on laptops is a bad idea.
8. You will not see full hashrate on pool immediately, you have to wait for 24 hours at least.

