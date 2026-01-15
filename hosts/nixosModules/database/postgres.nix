{ lib, config, pkgs, ...}:
{
	options = {
		postgresModule.enable = lib.mkEnableOption "enabels postgres";
	};

	config = lib.mkIf config.postgresModule.enable {
		services.postgresql = {
			enable = true;
			ensureDatabases = [ "mydatabase" ];
			authentication = pkgs.lib.mkOverride 10 ''
				#type database DBuser auth-method
				local all      all    trust
			'';
		};
	};
}
