{
  description = "Example Darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/release-23.05";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";      
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs }:
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#RoosBook
    darwinConfigurations."RoosBook" = nix-darwin.lib.darwinSystem {
      modules = [ 
        ./modules/configuration.nix
        ./modules/environment.nix
        ./modules/zsh.nix
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
      ];
    };

    # # Expose the package set, including overlays, for convenience.
    # darwinPackages = self.darwinConfigurations."RoosBook".pkgs;
  };
}
