{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		ntfs3g
	];
	fileSystems = {
		"/mnt/Drive1" = {
			device = "/dev/sdb2";
			fsType = "ntfs-3g";
			options = [ "rw" "uid=1000" ];
		};
	};
}
