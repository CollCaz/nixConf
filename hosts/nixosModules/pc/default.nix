{ lib, ... }:

{
  imports = [
    ./batteryModule.nix
    ./fonts.nix
    ./hyprlandModule.nix
    ./powerManagementModule.nix
    ./printingModule.nix
    ./soundModule.nix
    ./stylix.nix
    ./misc.nix
  ];

  fontsModule.enable =
    lib.mkDefault true;

  hyprlandModule.enable =
    lib.mkDefault true;

  soundModule.enable =
    lib.mkDefault true;

  printingModule.enable =
    lib.mkDefault true;

  miscModule = {
    enable =
      lib.mkDefault true;
    gvfs.enable = true;
  };
}
