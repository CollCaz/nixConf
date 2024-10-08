{
  description = "nixos flake";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ...}:
    let 
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        beatrix = nixpkgs.lib.nixosSystem {
          inherit system;
          # modules = [./configuration.nix];
          modules = [./hosts/beatrix/configuration.nix];
        };
      };

      homeConfigurations = {
        coll = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ 
          ./home.nix 
          ];
        };
      };
    };
}
