{ ... }:

{
	imports = 
		[
			../core.nix
			../nixosModules/pc/default.nix
			../nixosModules/networkModule.nix
		];

	networking.hostName = "beatrix";
	time.timeZone = "Africa/Tripoli";

	batteryModule.enable = true;
	powerManagementModule.enable = true;

	networkModule = {
		enable = true;

		firewall = {
			enable = true;
		};
	};
}
