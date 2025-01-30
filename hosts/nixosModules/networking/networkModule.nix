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
    };
  };

  config = lib.mkIf config.networkModule.enable {
    networking = {
      networkmanager.enable = true;
      nameservers = [ "1.1.1.1" "8.8.8.8" ];

      firewall = {
        enable = config.networkModule.firewall.enable;

        allowedTCPPorts =
          lib.mkIf config.networkModule.firewall.openDebugPorts [ 8080 8081 8088 2222 22 ];
        allowedUDPPorts =
          lib.mkIf config.networkModule.firewall.openDebugPorts [ 8080 8081 8088 2222 22];
      };
    };
  };
}
