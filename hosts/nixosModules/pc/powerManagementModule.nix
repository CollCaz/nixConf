{ lib, config, ... }:

{
  options = {
    powerManagementModule.enable = 
      lib.mkEnableOption "enables power management";
  };

  config = lib.mkIf config.powerManagementModule.enable {
    powerManagement.enable = true;
    services.thermald.enable = true;
  };
}
