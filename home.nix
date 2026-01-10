{ pkgs, ... }: let
in {
  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
  };


  home =  {
    username = "coll";
    homeDirectory = "/home/coll";

    file = builtins.listToAttrs (
      builtins.map (name: {
        name = ".config/${name}";
        value = {
          enable = true;
          source = ./config + "/${name}";
          force = true;
        };
      }) (builtins.attrNames (builtins.readDir ./config))
    );



    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    stateVersion = "23.11"; # Please read the comment before changing.

  };

  imports = [
    ./homeManagerModules/shell/default.nix
    # ./homeManagerModules/git/gitModule.nix
    # ./homeManagerModules/programs/spotify.nix
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
    brave
    croc
    fira
    gnome-keyring
    gnumake
    hyprpaper
    hyprshot
    kitty
    luarocks
    networkmanagerapplet
    obs-studio
    pamixer
    pavucontrol
    protonvpn-gui
    qbittorrent
    smartmontools
    telegram-desktop
    tofi
    vivid
    vlc
    waybar
    vesktop
    bun
    hello
    mpv
    pcsx2
    rpcs3
    p7zip
    thunderbird

   

    #Languages
    go
    python3
    gcc
    lua

    #LSP
    lua-language-server
    nixd

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
  services = {
    dunst = {
      enable = true;
    };
  };

  programs.kitty = {
    enable = true;
    #theme = "Gruvbox Dark Hard";
  };
}

