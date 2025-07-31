{
  description = "nixos flake";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ...}@inputs:
    let 
      system = "x86_64-linux";

      overlays = [
        (final: prev: {
          hello = prev.hello.overrideAttrs (old: {
            name = "hello-overlaid";
          });
        })
      ];

    in {
      nixosConfigurations = {
        orthus = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            {
              nixpkgs.overlays = overlays;
            }
            ./hosts/orthus/configuration.nix
            inputs.stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.coll = import ./home.nix;
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
        beatrix = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            {
              nixpkgs.overlays = overlays;
            }
            ./hosts/beatrix/configuration.nix
            inputs.stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.coll = import ./home.nix;
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
      };
    };
}
