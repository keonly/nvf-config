{lib, ...}: {
  vim.utility.snacks-nvim.setupOpts.lazygit = {
    enabled = true;

    theme = {
      activeBorderColor = {
        fg = "Normal";
        bold = true;
      };
      inactiveBorderColor = {
        fg = "LineNr";
      };
    };
  };

  vim.keymaps = [
    {
      key = "<leader>gg";
      mode = "n";
      lua = true;
      action = "require('snacks').lazygit.open";
      desc = "Open lazygit";
    }
  ];
}
