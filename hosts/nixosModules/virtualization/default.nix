{ lib, config, ... }:
{
	options = {
		virtualisationModule = {
			enable =
				lib.mkEnableOption "enable virtualisation module";
			vbox = {
				enable = lib.mkEnableOption "enable virtual box";
			};
			virtManager = {
				enable = lib.mkEnableOption "enable virt manager";
			};
			podman = {
				enable = lib.mkEnableOption "enable podman";
			};
			docker = {
				enable = lib.mkEnableOption "enable docker";
			};
		};
	};
	config = lib.mkIf config.virtualisationModule.enable {
		users.extraGroups.vboxusers.members = [ "coll" ];
		users.extraGroups.libvirtd.members = [ "coll" ];

		programs.virt-manager.enable = true;

		virtualisation = {
			spiceUSBRedirection = {
				enable = true;
			};

			podman = lib.mkIf config.virtualisationModule.podman.enable {
				enable = true;
				dockerCompat = true;
				defaultNetwork.settings = { dns_enabled = true; };
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
