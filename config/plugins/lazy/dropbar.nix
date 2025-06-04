{pkgs, ...}: {
  vim.lazy.plugins."dropbar.nvim" = {
    package = pkgs.vimPlugins.dropbar-nvim;
    setupModule = "dropbar";
    event = [
      {
        event = "User";
        pattern = "LazyFile";
      }
    ];

    after =
      # lua
      ''
        local dropbar_api = require('dropbar.api')
        vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
        vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
        vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
      '';
  };
}
