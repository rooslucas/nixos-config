{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      lg = "lazygit";
      nd = "nix develop";
    };
  };
}
