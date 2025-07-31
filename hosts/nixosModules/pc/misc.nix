{ lib, config, ... }:

{
  options = {
    miscModule = {
      enable = lib.mkEnableOption "enables misc module";
      gvfs.enable = lib.mkEnableOption "enables gvfs";
    };
  };

  config = lib.mkIf config.miscModule.enable {
    services.gvfs.enable = config.miscModule.gvfs.enable;
  };
}
