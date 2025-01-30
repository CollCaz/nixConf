{ lib, config, ... }:
{
	options = {
		virtualisationModule = {
			enable =
				lib.mkEnableOption "enable virtualisation module";
			vbox = {
				enable = lib.mkEnableOption "enable virtual box";
			};
			docker = {
				enable = lib.mkEnableOption "enable docker";
			};
		};
	};
	config = lib.mkIf config.virtualisationModule.enable {
		# virtualisation.podman = {
		# 	enable = true;
		# 	dockerCompat = true;
		# };
		# environment.systemPackages = [ pkgs.distrobox ];
		virtualisation.docker = lib.mkIf config.virtualisationModule.docker.enable {
			enable = true;
			rootless = {
				enable = true;
				setSocketVariable = true;
			};
		};
		users.extraGroups.vboxusers.members = [ "coll" ];
		virtualisation.virtualbox = lib.mkIf config.virtualisationModule.vbox.enable {
			host = {
				enable = true;
				enableKvm = false;
				addNetworkInterface = false;
			};
		};
	};
}
