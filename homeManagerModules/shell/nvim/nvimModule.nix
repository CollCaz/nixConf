{ pkgs, lib, config, ... }:

let
	config-repo = pkgs.fetchFromGitHub {
  owner = "CollCaz";
  repo = "Neovim-Config";
  rev = "3cdba4254c652e262965093fd7792850a6d1f019";
  hash = "sha256-kkADL4tMfhm1YUJR4eoiu33ZspvZ7Pb6aMVOWqGu4po=";
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
			sessionVariables = {
				EDITOR = "nvim";
			};
		};
	};
}
