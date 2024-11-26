{ lib, config, pkgs, ... }:
{
	options = {
		steamModule.enable = lib.mkEnableOption "enables steam";
	};

	config = lib.mkIf config.steamModule.enable {
		programs = {
			steam = {
				enable = true;

				remotePlay.openFirewall = true;

				dedicatedServer.openFirewall = true;

				localNetworkGameTransfers.openFirewall = true;

				package = pkgs.steam.override {
				  extraEnv = {
				    MANGOHUD = true;
				    OBS_VKCAPTURE = true;
				    RADV_TEX_ANISO = 16;
				  };
				  extraLibraries = p: with p; [
				    atk
				  ];
				};

				extraCompatPackages = with pkgs; [
					proton-ge-bin
				];
			};
		};
		hardware.xone.enable = true;
	};
}
