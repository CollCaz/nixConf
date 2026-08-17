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
	fileSystems = {
		"/mnt/Drive2" = {
			device = "/dev/disk/by-uuid/59B03B5B610C6245";
			fsType = "ntfs-3g";
			options = [ "rw" "uid=1000" ];
		};
	};
}
