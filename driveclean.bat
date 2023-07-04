net stop wuauserv
powercfg.exe /hibernate off
sc config wsearch start= disabled
net stop wsearch
REG ADD "HKLM\SOFTWARE\Microsoft\Windows Search" /v SetupCompletedSuccessfully /t REG_DWORD /d 0 /f
del "%ProgramData%\Microsoft\Search\Data\Applications\Windows\Windows.edb"
del "%ProgramData%\Microsoft\Search\Data\Applications\Windows\Windows.db"
:wsearch
sc config wsearch start= delayed-auto
net start wsearch
IF NOT %ERRORLEVEL%==0 (goto :wsearch) ELSE goto :END
:END
for /d %%F in (c:\users\*) do del "%%F\appdata\local\temp\*" /s /q
del %systemdrive%\$Recycle.Bin\* /q /f /s
del %windir%\Temp\* /q /f /s
del %temp%\* /q /f /s
del %windir%\SoftwareDistribution\Download\* /q /f /s
del %windir%\prefetch\*.* /q /f /s
del "%windir%\SoftwareDistribution\DataStore\Logs\edb.log"
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=4096,MaximumSize=8192
net start wuauserv
