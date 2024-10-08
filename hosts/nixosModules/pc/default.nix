{ lib, ... }:

{
  imports = [
    ./batteryModule.nix
    ./fonts.nix
    ./hyprlandModule.nix
    ./powerManagementModule.nix
    ./printingModule.nix
    ./soundModule.nix
  ];

  fontsModule.enable =
    lib.mkDefault true;
  hyprlandModule.enable =
    lib.mkDefault true;
  soundModule.enable =
    lib.mkDefault true;
  printingModule.enable =
    lib.mkDefault true;
}
