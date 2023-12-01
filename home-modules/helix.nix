{ ... }:
{
  programs.helix = {
    enable = true;

    settings = {
      theme = "catppuccin_frappe";
      editor = {
        auto-format = true;
        completion-trigger-len = 0;
        scroll-lines = 1;
        scrolloff = 5;
        cursorline = true;
        color-modes = true;
        indent-guides.render = true;
        file-picker.hidden = false;
        auto-pairs = false;
        lsp = {
          enable = true;
          display-messages = true;
          display-inlay-hints = true;
        };
        bufferline = "always";
        statusline = {
          left = [ "mode" "spinner" "file-name" ];
          right = [ "diagnostics" "position" "total-line-numbers" "file-encoding" ];
          center = [ "version-control" ];
        };
        soft-wrap = {
          enable = true;
        };
      };

      keys.normal.space = {
        "h" = ":toggle-option lsp.display-inlay-hints";
        "c" = [ ":write-all" ];
        # f and F are swapped, as picking in cwd is much more common for me.
        "f" = "file_picker_in_current_directory";
        "F" = "file_picker";
      };
    };
  };
}

