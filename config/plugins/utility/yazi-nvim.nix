{
  vim.utility.yazi-nvim = {
    enable = true;

    mappings = {
      openYazi = "<leader>-";
      openYaziDir = "<leader>cw";
      yaziToggle = "<C-y>";
    };

    setupOpts = {
      open_for_directories = true;
    };
  };
}
