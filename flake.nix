{
  description = "Nix Os Flake configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
# Home manager input 
  home-manager ={
  url = "github:nix-community/home-manager";
  inputs.nixpkgs.follows = "nixpkgs";
    };
 #Kwin effect forceblur   
    kwin-effects-forceblur = {
      url = "github:taj-ny/kwin-effects-forceblur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Added 'kwin-effects-forceblur' here so the function can use it
  outputs = { self, nixpkgs,home-manager, kwin-effects-forceblur, ... }@inputs: {
    nixosConfigurations.blonde-flakes = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      # This passes the input into your configuration.nix file
      specialArgs = { inherit kwin-effects-forceblur; };
      modules = [ ./configuration.nix
  # Add Home Manager Nixos modules
home-manager.nixosModules.home-manager
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "backup";

# Define the user config file
  home-manager.users.blonde = import ./home.nix;

# Allow home.nix to see kwin-effects-forceblur if needed
  home-manager.extraSpecialArgs = {inherit kwin-effects-forceblur; };
}
];

  };
    };
  }
