# Copyright (C) 2025 Mario Raúl Pérez
# Author Website: https://www.marioperez.dev
# Licensed under the GNU General Public License v3.0

If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process -FilePath PowerShell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
    Exit
}

Add-Type @"
    using System;
    using System.Runtime.InteropServices;
    public class User32 {
        [DllImport("user32.dll", SetLastError = true)]
        public static extern bool BlockInput(bool fBlockIt);
    }
"@

Add-Type @"
    using System;
    using System.Runtime.InteropServices;
    public class ShowWindowHelper {
        [DllImport("user32.dll")]
        public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
        [DllImport("kernel32.dll")]
        public static extern IntPtr GetConsoleWindow();

        public static void Minimize() {
            IntPtr hWnd = GetConsoleWindow();
            if (hWnd != IntPtr.Zero) {
                ShowWindow(hWnd, 6);
            }
        }
    }
"@

for ($i = 5; $i -ge 1; $i--) {
    Write-Host "El teclado y el mouse se bloquearán en $i segundos... Pulsa ctrl+alt+del y luego escape para desbloquear." -NoNewline
    Start-Sleep -Seconds 1
    Write-Host "`r" -NoNewline
}

[User32]::BlockInput($true)

Clear-Host
Write-Host "Teclado y mouse bloqueados. Pulsa ctrl+alt+del y luego escape para desbloquear."
Write-Host "La ventana se minimizará automáticamente. Una vez activo el teclado, pulsa cualquier tecla para cerrar."
Start-Sleep -Seconds 3

[ShowWindowHelper]::Minimize()

while (-not $Host.UI.RawUI.KeyAvailable) {
    Start-Sleep -Milliseconds 500
}

[User32]::BlockInput($false)
Write-Host "Teclado desbloqueado."
