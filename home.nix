{ config, pkgs,...}:

{
# User info
home.username = "blonde";
home.homeDirectory = "/home/blonde";
# State version
home.stateVersion = "25.11";
#User-specific Packages
#Move app here if you dont need avaiable for "root"
home.packages = with pkgs; [
#Desktopapps
signal-desktop
kdePackages.kate


#CLI tools
neofetch
yazi

];

# Program and & Shell
programs.home-manager.enable = true; 
# Starship config
programs.starship ={
enable = true;
enableFishIntegration = true;
  };
# Fish shell config
programs.fish = {
enable = true;
# Aliasas 
shellAliases ={
   btw = "echo i use nixos,btw";
   rebuild = " sudo nixos-rebuild switch --flake . --impure";
   v = "nvim";
    };
  };
#Git config
programs.git = {
  enable = true; 
  settings = {
      user = {
          name = "blondeuser";
          email = "vihao.cloud2@gmail.com";
        };
    }; 
  };
  }
