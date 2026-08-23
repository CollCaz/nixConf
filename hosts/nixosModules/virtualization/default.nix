{ lib, config, ... }:
{
  options.virtualisationModule = {
    enable = lib.mkEnableOption "enable virtualisation module";

    user = lib.mkOption {
      type = lib.types.str;
      description = "The user to add to related groups";
    };

    vbox.enable = lib.mkEnableOption "enable VirtualBox";

    virtManager.enable = lib.mkEnableOption "enable virt-manager";

    podman.enable = lib.mkEnableOption "enable Podman";

    docker.enable = lib.mkEnableOption "enable Docker";
  };

  config = lib.mkIf config.virtualisationModule.enable {
    users.extraGroups = {
      vboxusers.members =
        lib.mkIf config.virtualisationModule.vbox.enable [
          config.virtualisationModule.user
        ];

      libvirtd.members =
        lib.mkIf config.virtualisationModule.virtManager.enable [
          config.virtualisationModule.user
        ];

      docker.members =
        lib.mkIf config.virtualisationModule.docker.enable [
          config.virtualisationModule.user
        ];
    };

    programs.virt-manager.enable =
      config.virtualisationModule.virtManager.enable;

    virtualisation = {
      spiceUSBRedirection.enable =
        config.virtualisationModule.virtManager.enable;

      podman = lib.mkIf config.virtualisationModule.podman.enable {
        enable = true;
        dockerCompat = true;

        defaultNetwork.settings = {
          dns_enabled = true;
        };
      };

      docker = lib.mkIf config.virtualisationModule.docker.enable {
        enable = true;
      };

      libvirtd = lib.mkIf config.virtualisationModule.virtManager.enable {
        enable = true;
      };

      virtualbox = lib.mkIf config.virtualisationModule.vbox.enable {
        host = {
          enable = true;
          enableKvm = false;
          addNetworkInterface = false;
        };
      };
    };
  };
}
