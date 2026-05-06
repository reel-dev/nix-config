{ config, pkgs, ... }:

{
  home.username = "reel";
  home.homeDirectory = "/home/reel";
  home.stateVersion = "25.11";
  home.packages = [
    pkgs.openssh
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "René Elbracht";
        email = "elbrachtrene@gmail.com";
      };
    };
  };  
  programs.zsh = {
    enable = true;
    initContent = ''
      export TERM=xterm-256color
    '';
  };
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      
      format = "$username$directory$character";
      right_format = "$git_branch$git_status";      

      character = {
        success_symbol = "[➜](#9ece6a)";
        error_symbol = "[➜](#f7768e)";
      };
      username = {
        show_always = true;
        format = "[$user](bold #7aa2f7)@";
      };
      directory = {
        format = "[$path](bold #e0af68) ";
        truncation_length = 0;
        truncate_to_repo = false;
      };
      git_branch = {
        format = "[$symbol$branch](bold #9ece6a)";
        symbol = " ";
      };
      git_status = {
        format = "[$all_status$ahead_behind](#f7768e)";
      };
    };
  };
  programs.helix = {
    enable = true;
  };

  programs.home-manager.enable = true;
}
