{ lib, ... }:
{
	imports = [
		./steamModule.nix
		./bottles.nix
	];

	steamModule.enable = lib.mkDefault true;
}
