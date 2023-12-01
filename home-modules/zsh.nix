{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      lg = "lazygit";
      nd = "nix develop";
    };
  };
}
