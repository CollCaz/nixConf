{ lib, ... }:
{
  imports = [
    ./networkModule.nix
  ];
  networkModule = {
    enable = lib.mkDefault true;
    firewall = {
      enable = lib.mkDefault true;
      openDebugPorts = lib.mkDefault true;
    };
  };
}
