# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs,  ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../hardware-configuration.nix
    ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 20;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  users = {
    groups = {};
    
    users = {
      coll = {
        isNormalUser = true;
        description = "Yassen Tambakti";
        extraGroups = [ "networkmanager" "wheel" "video" ];
        packages = [];
      };
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix = {
    optimise = {
      automatic = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 15d";
    };
    # Flakes
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  i18n = {
    defaultLocale = "en_GB.UTF-8";
  };


  environment.systemPackages = with pkgs; [
    fd
    file
    git
    ripgrep
    tree
    unrar
    unzip
    neovim
    vim 
    wget
    zip
  ];

  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
