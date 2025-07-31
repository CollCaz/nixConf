{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		ntfs3g
	];
	fileSystems = {
		"/mnt/Drive1" = {
			device = "/dev/disk/by-uuid/12CC5B63CC5B3FE1";
			fsType = "ntfs-3g";
			options = [ "rw" "uid=1000" ];
		};
	};
}
