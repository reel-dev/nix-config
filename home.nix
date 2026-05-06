{ config, pkgs, ... }:

{
  home.username = "reel";
  home.homeDirectory = "/home/reel";
  home.stateVersion = "25.11";
  home.packages = [
    pkgs.nano
    pkgs.openssh
    pkgs.git
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.zsh = {
    enable = true;
  };
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };

  programs.home-manager.enable = true;
}
