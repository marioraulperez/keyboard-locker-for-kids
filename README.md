# Keyboard Locker for Kids

This PowerShell script is designed to lock the keyboard and mouse using the `BlockInput` function from the `user32.dll` library. Its primary purpose is to allow children to watch educational videos or attend video calls with family without accidentally interacting with the keyboard or mouse. Unlocking is only possible by pressing `Ctrl+Alt+Del`, ensuring the lock remains active until an adult intervenes.

**Instrucciones tambien disponibles en [español](README-es.md).**

## Features

- Detects if it is running with administrator permissions. If not, it requests elevation via UAC.
- Completely locks the keyboard and mouse.
- Unlocks only through the `Ctrl+Alt+Del` key combination.

## Requirements

- Windows 7 or higher.
- Administrator permissions to run the script.
- PowerShell with permissions to import types (included by default in Windows).

## Usage

1. Save [the script](KeyboardLocker.ps1) to a file with the `.ps1` extension (e.g., `KeyboardLocker.ps1`).
2. Open a command prompt or PowerShell window in the directory where the script is located.
3. Run the following command to bypass potential restricted execution policies and execute the script:
   ```powershell
   powershell -NoProfile -ExecutionPolicy Bypass -File "KeyboardLocker.ps1"
   ```

## Notes

- This script is designed for use in controlled environments. It should not be used in situations where input locking could cause security or productivity issues.
- The lock will automatically disable when `Ctrl+Alt+Del` is pressed, allowing the system to return to normal user control.
- **Note about the touchpad:** Although the keyboard and mouse are locked, the laptop's touchpad typically remains active. However, most laptops have a special function key (e.g., `Fn` + a specific key) to manually disable the touchpad.

## Warning

This script modifies user input and requires elevated privileges. Use it cautiously and only when absolutely necessary.

