# nix-config

Home Manager configuration for Arch Linux on WSL.
Basically a system for managing a user environment using the Nix package manager.

## What's included

- **Shell**: zsh with Starship prompt
- **Editor**: Helix
- **Git**: configured with user identity
- **Other Packages**: openssh

## Recovery

### 1. Install WSL & Arch Linux

```sh
wsl --update
wsl --install archlinux
```

### 2. Create a user

```sh
useradd -m -s /bin/bash yourname
passwd yourname
```

Set as default WSL user:

```sh
echo -e "\n[user]\ndefault=yourname" >> /etc/wsl.conf
```

Then restart WSL:

```sh
wsl --shutdown
```

### 3. Install Nix

```sh
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
nix run nixpkgs#git -- clone https://github.com/reel-dev/nix-config.git
```

Add the output to: GitHub → Settings → SSH and GPG Keys → New SSH Key

### 4. Restore configuration

```sh
cd nix-config
nix run home-manager/master -- switch --flake .
```

### 5. Set fish as default shell

```sh
echo "/home/yourname/.nix-profile/bin/fish" >> /etc/shells
chsh -s /home/yourname/.nix-profile/bin/fish yourname
```

Restart WSL — done. Everything is reproduced automatically.
