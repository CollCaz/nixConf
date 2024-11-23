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
      # pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        beatrix = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/beatrix/configuration.nix
            inputs.stylix.nixosModules.stylix
            home-manager.nixosModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPkgs = true;
              home-manager.users.coll = import ./home.nix;
            }
          ];
        };
      };

      # homeConfigurations = {
      #   coll = home-manager.lib.homeManagerConfiguration {
      #     inherit pkgs;
      #     modules = [ 
      #       ./home.nix
      #     ];
      #   };
      # };
    };
}
