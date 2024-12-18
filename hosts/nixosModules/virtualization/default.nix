{ lib, config, ... }:
{
	options = {
		virtualisationModule = {
			enable =
				lib.mkEnableOption "enable virtualisation module";
			vbox = {
				enable = lib.mkEnableOption "enable virtual box";
				enableKvm = lib.mkEnableOption "enable kvm support";
			};
		};
	};
	config = lib.mkIf config.virtualisationModule.enable {
		# virtualisation.podman = {
		# 	enable = true;
		# 	dockerCompat = true;
		# };
		# environment.systemPackages = [ pkgs.distrobox ];
		virtualisation.virtualbox = lib.mkIf config.virtualisationModule.enableVirtualBox {
			host = {
				enable = true;
				enableKvm = true;
			};
		};
	};
}
