curl -o "C:\gandalf.bmp" https://raw.githubusercontent.com/Berkybroon/batches/main/l-intro-1662053031.bmp
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\gandalf.bmp" /f
taskkill /IM explorer.exe /f
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1, True
explorer.exe
timeout 2
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1, True