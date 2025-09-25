{ lib, ... }:

{
  imports = [
    ./shellModule.nix
    ./yazi/yaziModule.nix
    ./newsboat/newsboatModule.nix
    ./zellij/zellijModule.nix
  ];
  
  shellModule.enable = lib.mkDefault true;
  shellModule.loginShell = lib.mkDefault true;

  yaziModule.enable = lib.mkDefault true;
  yaziModule.fishIntegration = lib.mkDefault true;

  newsboatModule.enable = lib.mkDefault true;

  zellijModule.enable = lib.mkDefault true;
}
