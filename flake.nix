{
  description = "Nix Os Flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    kwin-effects-forceblur = {
      url = "github:taj-ny/kwin-effects-forceblur";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Added Houdini Input
    houdini-nix.url = "github:permahorse/houdini-nix";
  };

  outputs = { self, nixpkgs, home-manager, kwin-effects-forceblur, houdini-nix, ... }: {
    nixosConfigurations.blonde-flakes = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      
      # We explicitly list every input here so you don't have to use "inputs." prefix
      specialArgs = { inherit kwin-effects-forceblur houdini-nix; };

      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "backup";
          home-manager.users.blonde = import ./home.nix;

          # We explicitly list them for Home Manager too
          home-manager.extraSpecialArgs = { inherit kwin-effects-forceblur houdini-nix; };
        }
      ];
    };
  };
}
