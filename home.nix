{ pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
  };

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

  imports = [
    ./homeManagerModules/shell/default.nix
    ./homeManagerModules/git/gitModule.nix
  ];

  xdg = {
    enable = true;
    mime.enable = true;

    mimeApps = {
      enable = true;

      defaultApplications = {
      "text/plain" = ["nvim"];
      };
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    protonvpn-gui
    protonvpn-cli_2
    pamixer
    pavucontrol
    vivid
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
    fd
    croc
    fira
    bat
    networkmanagerapplet
    gh
    scc
    cowsay
    sqlite
    luarocks
    gnirehtet
    hyprpaper
    hyprshot
    smartmontools
    lazygit
    ripgrep
    telegram-desktop
    jetbrains.pycharm-community-bin
    qbittorrent
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
    #theme = "Gruvbox Dark Hard";
  };
}
