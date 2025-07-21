{
  vim.treesitter = {
    enable = true;

    context = {
      enable = true;

      setupOpts = {
        separator = null;
      };
    };
  };

  vim.highlight."TreesitterContext" = {
    bg = "#393939";
  };
}
