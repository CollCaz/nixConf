{ pkgs, ... }:

{
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
    brave
    croc
    fira
    firefox
    gnirehtet
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
    pkg-config
    protonvpn-cli_2
    protonvpn-cli_2
    protonvpn-gui
    protonvpn-gui
    qbittorrent
    scc
    smartmontools
    sqlite
    telegram-desktop
    tofi
    vivid
    vlc
    waybar
    webcord-vencord
    wezterm
    whatsapp-for-linux
    obsidian
    vesktop
    bun
    vscodium-fhs
    figma-linux
    ghostty
    hello

   

    #Languages
    go
    python3
    gcc
    lua
    odin

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
  services = {
    dunst = {
      enable = true;
    };
  };

  programs.mpv = {
    enable = true;
  };

  programs.kitty = {
    enable = true;
    #theme = "Gruvbox Dark Hard";
  };
}
