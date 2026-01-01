{ config, pkgs, ... }:

{
  # User info
  home.username = "blonde";
  home.homeDirectory = "/home/blonde";
  home.stateVersion = "25.11";

  # User-specific packages
  home.packages = with pkgs; [
    signal-desktop
    kdePackages.kate
    neofetch
    yazi
    fastfetch
    cmatrix #matrix rain
    rustdesk-flutter #remote dekstopcontrol app  
    kde-rounded-corners # kwin effect
    krita #drawing app
  ];

  # Home Manager itself
  programs.home-manager.enable = true;

  # Starship config
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  # Fish shell config
  programs.fish = {
    enable = true;
    shellAliases = {
      btw = "echo i use nixos, btw";
      rebuild = "sudo nixos-rebuild switch --flake . --impure";
      v = "nvim";
    };
  };

  # Ghostty config
  programs.ghostty = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      command = "${pkgs.fish}/bin/fish";
      theme = "TokyoNight";
      font-family = "JetBrainsMono Nerd Font";
      font-size = 12;
      background-opacity = 0.85;
      background-blur = true;
      window-decoration = false;
      confirm-close-surface = false;
      window-padding-x = 15;
      window-padding-y = 15;
      window-padding-balance = true;
    };
  };

  # Git config
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
