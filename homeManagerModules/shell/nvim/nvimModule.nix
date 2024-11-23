{ pkgs, lib, config, ... }:

let
	config-repo = pkgs.fetchgit {
		url = "https://github.com/CollCaz/Neovim-Config.git";
		rev = "";
	};
in
{
	options = {
		nvimModule.enable =
			lib.mkEnableOption "enable neovim";
	};

	config = lib.mkIf config.nvimModule.enable {
		home = {
			packages = with pkgs; [
				neovim
			];

			file = {
				".config/nvim".recursive = true;
				".config/nvim".source = config-repo;
			};
		};
	};
}
