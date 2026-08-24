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
			../nixosModules/database/default.nix
			../nixosModules/virtualization/default.nix

			./devices.nix
		];

	virtualisationModule = {
		user = "coll";
		enable = true;
		docker = {
			enable = true;
		};
	};

	networking.hostName = "orthus";
	time.timeZone = "Africa/Tripoli";

	pamModule.enable = true;

	cosmicModule.enable = false;

	nvidiaModule.enable = true;
}
