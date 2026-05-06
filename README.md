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
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
```

Enable Flakes:

```sh
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >> ~/.config/nix/nix.conf
```

### 4. Set up SSH key for GitHub

```sh
ssh-keygen -t ed25519 -C "your@email.com"
cat ~/.ssh/id_ed25519.pub
```

Add the output to: GitHub → Settings → SSH and GPG Keys → New SSH Key

### 5. Restore configuration

```sh
nix run nixpkgs#git -- clone git@github.com:reel-dev/nix-config.git
cd nix-config
nix run home-manager/master -- switch --flake .
```

### 6. Set zsh as default shell

```sh
echo "/home/yourname/.nix-profile/bin/zsh" >> /etc/shells
chsh -s /home/yourname/.nix-profile/bin/zsh yourname
```

Restart WSL — done. Everything is reproduced automatically.
