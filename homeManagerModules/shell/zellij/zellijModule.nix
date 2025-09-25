{config, lib, ...}:
{
  options = {
    zellijModule.enable = lib.mkEnableOption "enables zellij";
  };

  config = lib.mkIf config.zellijModule.enable {
    programs.zellij = {
      enable = true;
      enableFishIntegration = true;

      settings = {
        theme = "gruvbox-dark";
      };
    };
  };
}
