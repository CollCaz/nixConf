{ lib, ... }:

{
  imports = [
    ./shellModule.nix
    ./yazi/yaziModule.nix
    ./nvim/nvimModule.nix
  ];
  
  nvimModule.enable = lib.mkDefault true;

  shellModule.enable = lib.mkDefault true;
  shellModule.loginShell = lib.mkDefault true;

  yaziModule.enable = lib.mkDefault true;
  yaziModule.fishIntegration = lib.mkDefault true;
}
