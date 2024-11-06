{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";      
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs, nixpkgs-unstable }:
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#RoosBook
    darwinConfigurations."RoosBook" = nix-darwin.lib.darwinSystem {
      modules = [ 
        ./modules/configuration.nix
        ./modules/environment.nix
        ./modules/zsh.nix
        ./modules/nix.nix
        home-manager.darwinModules.home-manager
        {
          users.users.roos = {
            name = "roos";
            home = "/Users/roos";
          };
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.roos = {
              # Home-manager level modules
              imports = [
                { home.stateVersion = "23.05"; }
                ./home-modules/direnv.nix
                ./home-modules/git.nix
                ./home-modules/helix.nix
                ./home-modules/kitty.nix
                ./home-modules/lazygit.nix
                ./home-modules/ssh.nix
                ./home-modules/zellij.nix
                ./home-modules/zsh.nix
              ];
            };
          };
        }
        {
          config._module.args = {
            pkgs-unstable = import inputs.nixpkgs-unstable { system = "aarch64-darwin"; config.allowUnfree = true; };
          };
        }

      ];
    };

    # # Expose the package set, including overlays, for convenience.
    # darwinPackages = self.darwinConfigurations."RoosBook".pkgs;
  };
}
