{ ... }:

{
	imports = 
		[
			./hardware-configuration.nix
			../core.nix
			../nixosModules/pc/default.nix
			../nixosModules/networking/default.nix
			../nixosModules/gaming/default.nix

			./devices.nix
		];

	networking.hostName = "orthus";
	time.timeZone = "Africa/Tripoli";
}
