net stop wuauserv
powercfg.exe /hibernate off
timeout 1
del %systemdrive%\$Recycle.bin\* /q /f /s
del %temp%\* /q /f /s
del %Windir%\SoftwareDistribution\Download\* /q /f /s
del C:\Windows\prefetch\*.* /q /f /s
del "%systemroot%\SoftwareDistribution\DataStore\Logs\edb.log"
timeout 1
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
timeout 1
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=2048,MaximumSize=4096
net start wuauserv