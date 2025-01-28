# Bloqueador de Teclado para Niños

Este script de PowerShell está diseñado para bloquear el teclado y el mouse usando la función `BlockInput` de la biblioteca `user32.dll`. Su propósito principal es permitir que los niños puedan ver videos educativos o atender videollamadas con familiares sin que puedan interactuar accidentalmente con el teclado o el mouse. El desbloqueo solo es posible pulsando `Ctrl+Alt+Del`, lo que garantiza que el bloqueo se mantenga hasta que un adulto intervenga.

## Características

- Detecta si se está ejecutando con permisos de administrador. Si no lo está, solicita elevación a través de UAC.
- Bloquea completamente el teclado y el mouse.
- Garantiza el desbloqueo solo a través de la combinación de teclas `Ctrl+Alt+Del`.

## Requisitos

- Windows 7 o superior.
- Permisos de administrador para ejecutar el script.
- PowerShell con permisos para importar tipos (por defecto incluido en Windows).

## Uso

1. Guarda [el script](KeyboardLocker.ps1) en un archivo con extensión `.ps1` (por ejemplo, `BloquearTeclado.ps1`).
2. Abre una ventana de comandos o PowerShell en el directorio donde tengas el script.
3. Ejecuta el siguiente comando para omitir posibles políticas de ejecución restringida y ejecutar el script:
   ```powershell
   powershell -NoProfile -ExecutionPolicy Bypass -File "BloquearTeclado.ps1"
   ```

## Notas

- Este script está diseñado para uso en entornos controlados. No debe utilizarse en situaciones en las que el bloqueo de entrada pueda causar problemas de seguridad o productividad.
- El bloqueo se desactivará automáticamente al presionar `Ctrl+Alt+Del`, lo que permite que el sistema vuelva al control normal del usuario.
- **Nota sobre touchpad:** Aunque el teclado y el mouse están bloqueados, el touchpad de las laptops suele permanecer activo. Sin embargo, la mayoría de las laptops tienen una tecla de función especial (como `Fn` + una tecla específica) que permite desactivar el touchpad manualmente.

## Advertencia

Este script modifica la entrada del usuario y requiere privilegios elevados. Úsalo con precaución y solo cuando sea absolutamente necesario.

