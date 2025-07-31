{ lib, config, ... }:
{
	options = {
		virtualisationModule = {
			enable =
				lib.mkEnableOption "enable virtualisation module";
			vbox = {
				enable = lib.mkEnableOption "enable virtual box";
			};
		};
	};
	config = lib.mkIf config.virtualisationModule.enable {
		# virtualisation.podman = {
		# 	enable = true;
		# 	dockerCompat = true;
		# };
		# environment.systemPackages = [ pkgs.distrobox ];
		users.extraGroups.vboxusers.members = [ "coll" ];
		
		virtualisation = {
			podman = {
				enable = true;
				dockerCompat = true;
				defaultNetwork.settings = { dns_enabled = true; };
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
