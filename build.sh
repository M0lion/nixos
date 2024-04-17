cd $(dirname $0)
sudo nix flake update
sudo nixos-rebuild switch --flake $(dirname $0)
