#!/usr/bin/env bash

sudo mv -f /etc/zshenv /etc/zshenv.before-nix-darwin
nix shell nixpkgs#git --command darwin-rebuild switch --flake .#RoosBook