{ ... }:

{
	imports = 
		[
			./hardware-configuration.nix
			../core.nix
			../nixosModules/pc/default.nix
			../nixosModules/networking/default.nix
			../nixosModules/virtualization/default.nix
		];

	networking.hostName = "beatrix";
	time.timeZone = "Africa/Tripoli";

	batteryModule.enable = true;
	powerManagementModule.enable = true;

	virtualisationModule = {
		enable = true;
		vbox.enable = true;
	};
	networkModule = {
		enable = true;

		firewall = {
			enable = false;
		};
	};
}
