{ pkgs, ... }:
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    with pkgs; [
      python3
      nodejs_21
      helix
      bottom
      wget
      curl
      neofetch
      git
      fzf
      git-lfs
      gnumake
      gh
      tree
    ];
  environment.variables = {
    PS1 = "%m %d $ ";
    PROMPT = "%m %d $ ";
    RPROMPT = "";
    EDITOR = "hx";
    VISUAL = "hx";
  };
}
