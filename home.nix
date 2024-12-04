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
    telegram-desktop
    waybar
    kitty
    wezterm
    pistol
    protonvpn-gui
    gnome-keyring
    obs-studio
    protonvpn-cli_2
    croc
    webcord-vencord
    fira
    networkmanagerapplet
    scc
    sqlite
    luarocks
    gnirehtet
    smartmontools
    telegram-desktop
    qbittorrent
    tofi
    hyprpaper
    hyprshot
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

  services = {
    dunst = {
      enable = true;
    };
  };

  programs.mpv = {
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
    #theme = "Gruvbox Dark Hard";
  };
}
