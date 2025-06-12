{
  vim.formatter = {
    conform-nvim = {
      enable = true;

      setupOpts = {
        formatters_by_ft = {
          css = ["prettier"];
          lua = ["stylua"];
          rust = ["rustfmt"];
          scala = ["scalafmt"];
          sql = ["sqlfluff"];
          javascript = ["prettier"];
          terraform = ["terraform_fmt"];
          typescript = ["prettier"];
          json = ["prettier"];
          markdown = ["prettier"];
          nix = ["alejandra"];
          python = ["ruff_format"];
        };
      };
    };
  };

  vim.keymaps = [
    {
      key = "<leader>cf";
      mode = "n";
      action = "require('conform').format";
      lua = true;
      desc = "Conform format";
    }
  ];
}
