{
  vim.mini = {
    ai.enable = true;
    basics.enable = true;
    bracketed.enable = true;
    comment.enable = true;
    cursorword.enable = true;
    hipatterns.enable = true;
    icons.enable = true;
    move = {
      enable = true;

      setupOpts = {
        mappings = {
          left = "<C-S-h>";
          right = "<C-S-l>";
          down = "<C-S-j>";
          up = "<C-S-k>";

          line_left = "<C-S-h>";
          line_right = "<C-S-l>";
          line_down = "<C-S-j>";
          line_up = "<C-S-k>";
        };
      };
    };
    pairs = {
      enable = true;

      setupOpts = {
        mappings = {
          "`" = {
            action = "closeopen";
            pair = "``";
            neigh_pattern = "[^\\`].";
            register = {cr = false;};
          };
        };
      };
    };
    snippets.enable = true;
    splitjoin.enable = true;
    surround.enable = true;
  };
}
