{ pkgs, lib, config, ... }:
# Fish and some other shell utilities
{
  options = {
    shellModule.enable =
      lib.mkEnableOption "enables fish shell";

    shellModule.loginShell =
      lib.mkEnableOption "fish as the login shell";
  };

  config = lib.mkIf config.shellModule.enable {
    home.packages = with pkgs; [
      fishPlugins.fzf-fish
      fishPlugins.done
      fishPlugins.sponge
      fishPlugins.colored-man-pages

      eza
      tokei
      killall
      fd
      bat
      ripgrep
      cowsay
      lazygit
      gh
    ];

    programs.fzf = {
      enable = true;
    };

    programs.bash = {
      enable = true;
      sessionVariables.EDITOR = "nvim";
      initExtra = lib.mkIf config.shellModule.loginShell ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
          then
            shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
            exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };

    programs.fish = {
      enable = true;
      shellInit = "fish_vi_key_bindings";
      shellInitLast = "${pkgs.fastfetch}/bin/fastfetch";
      preferAbbrs = true;

      shellAliases = {
        ls = "eza --icons always --color auto";
        fzf = "fzf  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54";
      };
      shellAbbrs = {
        d = "df -h";
        hm = "home-manager";
        hms = "home-manager switch --flake ~/.dotfiles/";
      };
      functions = {
        fish_greeting.body = '''';
        fish_user_key_bindings = {
          body = ''
            bind -M insert \cy accept-autosuggestion
          '';
        };
        mount = {
          body = ''
            sudo mount $1 $2
          '';
        };
      };
    };

    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        add_newline = true;
      };
    };

    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep 3 --keep-since 3d";
      };
      flake = "${config.home.homeDirectory}/.dotfiles";
    };

    programs.zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    programs.direnv = {
      enable = true;
    };
    programs.btop = {
      enable = true;
      settings = {
        vim_keys = true;
        # color_theme = "gruvbox_dark";
        update_ms = 100;
        proc_sorting = "memory";
        proc_tree = true;
      };
    };
  };
}
