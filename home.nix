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
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      fish_add_path /nix/var/nix/profiles/default/bin
      fish_add_path $HOME/.nix-profile/bin
    '';
  };
  programs.starship = {
    enable = true;
    settings = {
            
      format = "$username$directory\n$character";
      right_format = "$git_branch$git_status";      

      character = {
        success_symbol = "[❯](bold #9ece6a)";
        error_symbol = "[❯](bold #f7768e)";
      };
      username = {
        show_always = true;
        format = "[$user](bold #7aa2f7)@";
      };
      directory = {
        format = "[$path](bold #e0af68)";
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
