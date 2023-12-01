{ ... }:
{
  programs.git =
    {
      enable = true;
      userName = "rooslucas";
      userEmail = "rooslucas@live.nl";
      lfs.enable = true;
      extraConfig = {
        color.ui = true;
        github.user = "rooslucas";
        init.defaultBranch = "main";
        commit.gpgsign = true;
        user.signingkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID5EwQZDTTIeqoYR8Aaw3F6b3q1Utchim4Dcoh/0e8/8";
        gpg."ssh".program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";
        gpg.format = "ssh";
      };
    };
}