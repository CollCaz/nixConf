{ ... }:

{
	imports = 
		[
			./hardware-configuration.nix
			../core.nix
			../nixosModules/pc/default.nix
			../nixosModules/networking/default.nix
		];

	networking.hostName = "orthus";
	time.timeZone = "Africa/Tripoli";
}
