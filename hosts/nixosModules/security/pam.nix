{ lib, config, ... }:
{
	options = {
		pamModule.enable =
			lib.mkEnableOption "enables pam module";
	};

	config = lib.mkIf config.pamModule.enable {
		security.pam = {
			enable = true;
			loginLimits = [
				{
					domain = "CollCaz";
					type = "-";
					item = "memlock";
					value = "unlimited";
				}
			];
		};
	};
}
