Set objShell = CreateObject("WScript.Shell")
objShell.Run "powershell -ExecutionPolicy Bypass -File .\change_wallpaper.ps1", 0, False
