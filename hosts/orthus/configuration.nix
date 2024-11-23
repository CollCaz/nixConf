{ ... }:

{
	imports = 
		[
			../core.nix
			../nixosModules/pc/default.nix
			../nixosModules/networkModule.nix
		];

	networking.hostName = "orthus";
	time.timeZone = "Africa/Tripoli";

	networkModule = {
		enable = true;

		firewall = {
			enable = true;
		};
	};
}
