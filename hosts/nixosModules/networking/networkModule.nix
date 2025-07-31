{ lib, config, ... }:

{
  options = {
    networkModule = {
      enable = 
      lib.mkEnableOption "enables networking";

      firewall = {
        enable =
          lib.mkEnableOption "enables firewall";
        openDebugPorts = 
          lib.mkEnableOption "opens ports 8080, 8081, 8088";
      };

      bluetooth = {
        enable =
          lib.mkEnableOption "enables bluetooth";
      };
    };
  };

  config = lib.mkIf config.networkModule.enable {

    hardware.bluetooth = {
      enable = config.networkModule.bluetooth.enable;
      powerOnBoot = config.networkModule.bluetooth.enable;
    };

    services.blueman.enable = 
      config.networkModule.bluetooth.enable;

    networking = {
      networkmanager.enable = true;
      nameservers = [ "1.1.1.1" "8.8.8.8" ];

      firewall = {
        enable = config.networkModule.firewall.enable;

        allowedTCPPorts = 
          lib.mkIf config.networkModule.firewall.openDebugPorts [ 8080 8081 8088 ];
        allowedUDPPorts = 
          lib.mkIf config.networkModule.firewall.openDebugPorts [ 8080 8081 8088 ];
      };
    };
  };
}
