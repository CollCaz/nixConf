# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 120;
      };
      efi.canTouchEfiVariables = true;
    };
  };

  # Take out later pls
  powerManagement.enable = true;
  services.thermald.enable = true;
  systemd.sleep = {
    extraConfig = ''
      HibernateDelaySec=1h
    '';
  };
  services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

       #Optional helps save long term battery health
       START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
       STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

      };
    };

  # Garbage Collection
  nix = {
    optimise = {
      automatic = true;
      #dates = "weekly";
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 15d";
    };
    # Flakes
    settings.experimental-features = [ "nix-command" "flakes" ];
  };


  networking = {
    hostName = "beatrix"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager.enable = true;
  };
  # Enable printing with CUPS
  services.printing.enable = true;

  # services.shadowsocks = {
  #   enable = true;
  #   extraConfig = { 
  #     dns = "google";
  #     server = "at1.ssporxy.xyz:1443";
  #   };
  #   localAddress = ["127.0.0.1" "0.0.0.0"];
  #   password = "NTkzNWQ3";
  #   # plugin = "${pkgs.shadowsocks-v2ray-plugin}/bin/v2ray-plugin";
  #   # pluginOpts = "server;host=vless://I_Love_🇵🇸_SSHMax_626d757@at2.vless.site:443?encryption=none&security=tls&sni=www.libyana.ly&type=ws&host=at2.vless.site&path=%2Fvless#sshmax-sshmaxislove-ws";
  # };


  # Set your time zone.
  time.timeZone = "Africa/Tripoli";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };
  # Sound with pipewire
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };


  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  # Hyprland
  programs.hyprland.enable = true;
  programs.fish.enable = true;

  # services.greetd= {
  #   enable = true;
  #   settings =  rec {
  #     initial_session = {
  #       command = "${pkgs.greetd.greetd}/bin/agreety --cmd Hyprland";
  #     };
  #     default_session = initial_session;
  #   };
  # };

  # Define a user account. Don't forget to set a password with ‘passwd’.
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


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim 
    neovim
    git
    xdg-desktop-portal-hyprland
    lxqt.lxqt-policykit
    wl-clipboard
    cliphist
    wev
    lua
    libnotify
    dunst
    wget
    brightnessctl
    gnome.gnome-keyring
    tree
    file
    unzip
    unrar
    imagemagick
    home-manager
  ];
  
  # Fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerdfonts
      fira-go
      fira
      roboto-slab
    ];
    
    fontconfig = {
      defaultFonts = {
        serif = [ "roboto-slab" ];
        sansSerif = [ "fira-go" "fira" ];
        monospace = [ "fira-code" "nerdfonts"];
      };
    };
  };
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 8080 8081 7000 ];
  # networking.firewall.allowedUDPPorts = [ 8080 8081 7000 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
