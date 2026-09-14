# Double Minegrub para un NixOS unstable ya instalado

Muestra el menú principal de Minecraft con **Singlebooter**, **Reiniciar** y
**Apagar**. Singlebooter abre las entradas actuales de GRUB con el tema de
selección de mundos, incluidas las generaciones de NixOS.

## Instalación en tu sistema actual

Copiá esta carpeta completa a `/etc/nixos/double-minegrub`. Agregá a tu
`configuration.nix` existente:

```nix
{
  imports = [
    ./hardware-configuration.nix
    ./double-minegrub/module.nix
  ];

  boot.loader.grub.double-minegrub-theme = {
    enable = true;
    mainMenuTimeout = 10; # null para esperar sin límite.
  };

  # Opcional: espera del segundo menú, con las entradas del sistema.
  boot.loader.timeout = 10;
}
```

Añadí el import a tu lista existente: conservá los demás imports y opciones.
El módulo usa el Nixpkgs de tu sistema, que debe ser `nixos-unstable`.
Conservá tu configuración actual de `boot.loader.grub.enable`, `device` o
`devices`, `efiSupport` y los puntos de montaje. No se necesita reinstalar
NixOS ni cambiar el particionado.

Requiere que el sistema ya use GRUB. Si usa systemd-boot, primero se necesita
adaptar el cargador a la configuración real de discos/UEFI del equipo; este
módulo detecta ese caso y no hace la conversión automáticamente.
Si tenés otro tema, quitá su asignación a `boot.loader.grub.theme` o deshabilitá
su módulo antes de habilitar este.

Sin flakes:

```sh
sudo nixos-rebuild build
sudo nixos-rebuild boot
```

Si tu sistema usa flakes, mantené tu flake actual y ejecutá, sustituyendo
`TU_HOST` por el nombre en `nixosConfigurations`:

```sh
# Si /etc/nixos está bajo Git, los archivos nuevos deben estar añadidos.
sudo git -C /etc/nixos add double-minegrub
sudo nixos-rebuild build --flake /etc/nixos#TU_HOST
sudo nixos-rebuild boot --flake /etc/nixos#TU_HOST
```

Reiniciá cuando quieras probarlo. `boot` prepara el próximo arranque.
La compilación inicial descarga ambos temas con revisiones y SHA-256 fijos.

## Integración y vuelta atrás

NixOS copia el paquete completo a `/boot/theme` (o al directorio de arranque
configurado) y carga las fuentes. El hook de GRUB abre el menú principal;
Singlebooter vuelve al `grub.cfg` generado por NixOS con una variable temporal
que evita el bucle. No se escribe esa variable en `grubenv`.
Las selecciones de un solo arranque hechas con `grub-reboot` omiten el menú
principal. Se conserva `boot.loader.grub.default` para el segundo menú.

No ejecutes el `install.sh` upstream, `grub-mkconfig` ni `grub-editenv` para
habilitar el tema: NixOS lo gestiona al reconstruir.

Para quitarlo, poné `enable = false;` y repetí `nixos-rebuild boot` con los
mismos argumentos. Si lo eliminás por completo, quitá también su import y
sus opciones. GRUB volverá al tema definido por el resto de tu configuración.

## Comprobaciones

Se verificaron localmente la sintaxis Nix, los hashes de los archivos
descargados y la presencia de los recursos de ambos temas. Este entorno de
preparación es Windows sin Nix: la evaluación Nix, `grub-script-check` y la
prueba visual de arranque quedan pendientes en Linux/NixOS.

El flake de la carpeta superior también exporta
`nixosModules.double-minegrub-theme`, `packages.<system>.double-minegrub-theme`
y comprobaciones ejecutables con `nix flake check path:. -L`.

Fuentes: [double-minegrub-menu](https://github.com/Lxtharia/double-minegrub-menu),
[Minegrub](https://github.com/Lxtharia/minegrub-theme),
[World Selection](https://github.com/Lxtharia/minegrub-world-sel-theme) y
[módulo GRUB de NixOS](https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/system/boot/loader/grub/grub.nix).
