{ lib, config, ... }:

{
  options = {
    networkModule.enable = 
      lib.mkEnableOption "enables networking";

    networkModule.firewall = {
      enable =
        lib.mkEnableOption "enables firewall";

    };
  };

  config = lib.mkIf config.networkModule.enable {
    networking = {
      networkmanager.enable = true;
      nameservers = [ "1.1.1.1" "8.8.8.8" ];

      firewall.enable = config.networkModule.firewall.enable;

      firewall.allowedTCPPorts = [ 8080 8081 8088 ];
      firewall.allowedUDPPorts = [ 8080 8081 8088 ];
    };
  };
}
