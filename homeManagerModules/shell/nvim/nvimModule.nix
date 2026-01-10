{ pkgs, lib, config, ... }:

let
  #config-repo = pkgs.fetchFromGitHub {
  #  owner = "CollCaz";
  #  repo = "Neovim-Config";
  #  rev = "main";
  #  hash = "sha256-odX2rNp5nq6NkxfeF8wbw3KGcEEzbXLaigMy3RSmfy4=";
  #};
in
{
  options = {
    nvimModule.enable =
      lib.mkEnableOption "enable neovim";
  };

  config = lib.mkIf config.nvimModule.enable {
    home = {
      packages = with pkgs; [
        neovim
      ];

      file = {
        ".config/nvim".recursive = true;
        ".config/nvim".source = ./nvimConfig;
      };
      sessionVariables = {
        EDITOR = "nvim";
      };
    };
  };
}
