{ lib, ... }:
{
	imports = [
		./postgres.nix
	];

	postgresModule.enable = lib.mkDefault true;
}
