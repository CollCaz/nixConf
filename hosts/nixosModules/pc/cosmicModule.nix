{ lib, config, ... }:

{
  options = {
   cosmicModule.enable = 
      lib.mkEnableOption "enables cosmic";  
  };

  config = lib.mkIf config.cosmicModule.enable {
    services.desktopManagers.cosmic.enable = true;
  };
}
