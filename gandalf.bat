curl -o "C:\gandalf.bmp" https://cdn-133.anonfiles.com/f7l2W470ya/e46f1564-1663106318/l-intro-1662053031.bmp
timeout 1
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "C:\gandalf.bmp" /f
timeout 1
taskkill /IM explorer.exe /f
explorer.exe
timeout 1
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
