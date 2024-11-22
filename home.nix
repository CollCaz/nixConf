{ pkgs, ... }:

{
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  home =  {
    username = "coll";
    homeDirectory = "/home/coll";

    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "23.11"; # Please read the comment before changing.

  };


  xdg = {
    enable = true;
    mime.enable = true;

    mimeApps = {
      enable = true;

      defaultApplications = {
      "inode/directory" = ["yazi.desktop"];
      "image/png" = ["yazi.desktop"];
      "image/jpg" = ["yazi.desktop"];
      "text/plain" = ["nvim"];
      };
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    pavucontrol
    vivid
    pamixer
    firefox
    brave
    hyprpicker
    waybar
    falkon
    kitty
    wezterm
    lf
    pistol
    tofi
    btop
    fzf
    fd
    croc
    fira
    bat
    networkmanagerapplet
    eza
    gh
    scc
    cowsay
    sqlite
    luarocks
    gnirehtet
    hyprpaper
    hyprshot
    smartmontools
    bottles
    lazygit
    ripgrep
    telegram-desktop
    yazi
    ripdrag
    jetbrains.pycharm-community-bin
    qbittorrent-qt5
    gnumake
    pkg-config

   

    #Languages
    go
    python3
    gcc
    lua

    #LSP
    lua-language-server
    gopls
    nixd
    clang-tools_18
    basedpyright

    # Fish
    fishPlugins.fzf-fish
    fishPlugins.done
    #fishPlugins.z
    fishPlugins.sponge
    fishPlugins.colored-man-pages

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  # xdg.configFile."waybar/config.jsonc".source = ../config.jsonc;
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".config".recursive = true;
    ".config".source = ./config;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # systemd.user.services = {
  #   shadowsocks-proxy = {
  #     enable = true;
  #     Unit = {
  #       Description = "Local Shadowsocks proxy";
  #       After = "network.target";
  #     };
  #     Install = {
  #       WantedBy = [ "default.target" ];
  #     };
  #     Service = {
  #       ExecStart = "${pkgs.shadowsocks-rust}/bin/sslocal -c ${config.home.homeDirectory}/shadowsocks.json";
  #       ExecStop = "${pkgs.toybox}/bin/killall sslocal";
  #     };
  #   };
  # };
  

  home.sessionVariables = {
    LS_COLORS = "$(vivid generate gruvbox-dark)";
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
  };

  imports = [
    # ./homeManagerModules/gtkModule.nix
  ];

  gtk = {
    enable = true;
    theme = {
      package = pkgs.gruvbox-gtk-theme;
      name = "dark standard pink black Dark";
    };
    # iconTheme = {
    #   package = pkgs.gruvbox-plus-icons;
    #   name = "Gruvbox-Plus-Dark";
    # };
  };

  services = {
    dunst = {
      enable = true;
    };
  };

  # gtk = {
  #   enable = true;
  #   theme = {
  #     package = pkgs.gruvbox-gtk-theme;
  #     name = "Gruvbox-Dark-BL";
  #   };
  #   iconTheme = {
  #     package = pkgs.gruvbox-plus-icons;
  #     name = "Gruvbox-Plus-Dark";
  #   };
  # };

  programs.mpv = {
    enable = true;
  };


  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fish = {
    enable = true;

    shellInit = ''
    theme_gruvbox dark hard
    '';
    
    shellAliases = {
      ls = "eza --icons always --color auto";
      fzf = "fzf  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54";
    };
    shellAbbrs = {
      d = "df -h";
      hm = "home-manager";
      lg = "lazygit";
      hms = "home-manager switch --flake ~/.dotfiles/";
      nv = "nvim";
    };
    functions = {
      fish_user_key_bindings = {
        body = ''
        bind -M insert \cy accept-autosuggestion
        '';
      };
      yy = {
      body = ''
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          cd -- "$cwd"
        end
        rm -f -- "$tmp"'';
      };
      mount = {
        body = ''
          sudo mount $1 $2
        '';
      };
    };
    plugins = [
      {
        name = "gruvbox";
        src = pkgs.fetchFromGitHub {
          owner = "Jomik";
          repo = "fish-gruvbox";
          rev = "80a6f3a7b31beb6f087b0c56cbf3470204759d1c";
          sha256 = "sha256-vL2/Nm9Z9cdaptx8sJqbX5AnRtfd68x4ZKWdQk5Cngo=";
        };
      }
    ];
    
  };

  programs.direnv = {
    enable = true;
  };

  
  programs.bash = {
    enable = true;
    sessionVariables = {
      LS_COLORS = "$(vivid generate gruvbox-dark)";
      EDITOR = "nvim";
    };
    initExtra = ''
       if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
         then
           shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
           exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
       fi
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = true;
    };
  };
 
  programs.git = {
    enable = true;
    userName = "CollCaz";
    userEmail = "62307305+CollCaz@users.noreply.github.com";
    aliases = {
      pu = "push";
      co = "checkout";
      cm = "commit";
    };
  };
  
  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
      color_theme = "gruvbox_dark";
      update_ms = 100;
      proc_sorting = "memory";
      proc_tree = true;
    };
  };

  programs.fzf = {
    enable = true;
  };

  programs.pistol = {
    enable = true;
    associations = [
      { mime = "text/*"; command = "bat --style=plain  --color=always %pistol-filename%";}
      { fpath = ".*.md$"; command = "bat --style=plain --paging=never --color=always %pistol-filename% | head -8"; }
      { mime = "image/*"; command = "kitten icat %pistol-filename%";}
    ];

  };

  programs.kitty = {
    enable = true;
    theme = "Gruvbox Dark Hard";
  };
}
