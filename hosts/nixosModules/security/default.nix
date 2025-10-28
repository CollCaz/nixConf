{ lib, ... }:
{
	imports = [
		./pam.nix
	];

	pamModule.enable = lib.mkDefault false;
}
