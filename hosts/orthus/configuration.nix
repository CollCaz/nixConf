{ ... }:

{
	imports = 
		[
			./hardware-configuration.nix
			../core.nix
			../nixosModules/pc/default.nix
			../nixosModules/networking/default.nix
			../nixosModules/gaming/default.nix
			../nixosModules/nvidia/default.nix
			../nixosModules/security/default.nix

			./devices.nix
		];

	networking.hostName = "orthus";
	time.timeZone = "Africa/Tripoli";

	pamModule.enable = true;

	nvidiaModule.enable = true;
}
