{ lib, config, ... }:
{
	options = {
		nvidiaModule.enable = lib.mkEnableOption "enables nvidia";
	};

	config = lib.mkIf config.nvidiaModule.enable {
		services.xserver.videoDrivers = ["nvidia"];
		hardware = {
			graphics.enable = true;
			nvidia = {
				modesetting.enable = true;
				powerManagement.enable = false;
				powerManagement.finegrained = false;
				open = false;
				nvidiaSettings = true;
				package = config.boot.kernelPackages.nvidiaPackages.stable;
			};
		};
	};
}
