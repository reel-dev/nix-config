# nix-config

Meine Home Manager Konfiguration.

## Wiederherstellung

1. Nix installieren:
   https://nixos.org/download Multi-user installation script

2. Repository clonen:
   nix run nixpkgs#git -- clone git@github.com:reel-dev/nix-config.git

3. cd nix-config

4. nix run home-manager/master -- switch --flake .
