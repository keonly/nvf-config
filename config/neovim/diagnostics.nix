{
  vim.diagnostics = {
    enable = true;

    config = {
      underline = true;
      virtual_text = true;
      signs = {
        text = {
          "vim.diagnostic.severity.ERROR" = "󰅚 ";
          "vim.diagnostic.severity.WARN" = "󰀪 ";
        };
      };

      nvim-lint.enable = true;
    };
  };
}
