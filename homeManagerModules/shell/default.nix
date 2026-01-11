{ lib, ... }:

{
  imports = [
    ./shellModule.nix
    ./yazi/yaziModule.nix
    ./newsboat/newsboatModule.nix
    ./zellij/zellijModule.nix
    #./nvim/nvimModule.nix
  ];
  
  shellModule.enable = lib.mkDefault true;
  shellModule.loginShell = lib.mkDefault true;

  yaziModule.enable = lib.mkDefault true;
  yaziModule.fishIntegration = lib.mkDefault true;

  newsboatModule.enable = lib.mkDefault true;

  zellijModule.enable = lib.mkDefault true;

  #nvimModule.enable = lib.mkDefault true;
}
