{ lib, ... }:

{
  imports = [
    ./shellModule.nix
    ./yazi/yaziModule.nix
  ];
  
  shellModule.enable = lib.mkDefault true;
  shellModule.loginShell = lib.mkDefault true;

  yaziModule.enable = lib.mkDefault true;
  yaziModule.fishIntegration = lib.mkDefault true;
}
