{
  description = "nixos flake";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, stylix, ... }@inputs:
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
          modules = [
            {
              nixpkgs.overlays = overlays;
            }
            ./hosts/orthus/configuration.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs; 
                inherit system;
              };
              home-manager.users.coll = {
                imports = [ 
                  ./home.nix 
                ];
              };
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
        beatrix = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            {
              nixpkgs.overlays = overlays;
            }
            ./hosts/beatrix/configuration.nix
            stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs; 
                inherit system;
              };
              home-manager.users.coll = {
                imports = [ 
                  ./home.nix 
                ];
              };
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
      };
    };
}
