$wallpaperFolder = ".\wallpapers" 

$wallpapers = Get-ChildItem -Path $wallpaperFolder -Filter "*.jpg" -File
$wallpapers += Get-ChildItem -Path $wallpaperFolder -Filter "*.png" -File
$wallpapers = $wallpapers | Get-Random

if ($wallpapers -eq $null) {
    Write-Host "Нет доступных изображений в папке $wallpaperFolder"
    exit
}

$wallpaperPath = $wallpapers.FullName

Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", CharSet = CharSet.Auto)]
    public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@
[Wallpaper]::SystemParametersInfo(0x0014, 0, $wallpaperPath, 0x01)

Write-Host "Обои изменены на: $wallpaperPath"
