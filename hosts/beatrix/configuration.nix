{ ... }:

{
	imports = 
		[
			./hardware-configuration.nix
			../core.nix
			../nixosModules/pc/default.nix
			../nixosModules/networking/default.nix
			../nixosModules/virtualization/default.nix
			../nixosModules/database/default.nix
		];

	networking.hostName = "beatrix";
	time.timeZone = "Africa/Tripoli";

	batteryModule.enable = true;
	powerManagementModule.enable = true;

	virtualisationModule = {
		user = "coll";
		enable = true;
		docker = {
			enable = true;
		};
	};

	networkModule = {
		enable = true;

		firewall = {
			enable = false;
		};
	};
}
