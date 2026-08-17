{ lib, config, ... }:

{
  options = {
   cosmicModule.enable = 
      lib.mkEnableOption "enables cosmic";  
  };

  config = lib.mkIf config.cosmicModule.enable {
    services.desktopManager.cosmic.enable = true;
  };
}
