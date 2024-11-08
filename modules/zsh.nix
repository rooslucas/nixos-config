{ ... }:
{
  programs.zsh = {
    enable = true;
    promptInit = ''
      if [ -n "''${commands[fzf-share]}" ]; then
        source "''$(fzf-share)/key-bindings.zsh"
        source "''$(fzf-share)/completion.zsh"
      fi
    '';
  };
}
