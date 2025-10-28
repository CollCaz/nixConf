{ lib, config, ... }:
{
	options = {
		pamModule.enable =
			lib.mkEnableOption "enables pam module";
	};

	config = lib.mkIf config.pamModule.enable {
		security.pam = {
			loginLimits = [
				{
					domain = "coll";
					type = "-";
					item = "memlock";
					value = "";
				}
			];
		};
	};
}
