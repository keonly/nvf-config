{
  vim.formatter = {
    conform-nvim = {
      enable = true;

      setupOpts = {
        formatters_by_ft = {
          css = [
            "prettierd"
            "prettier"
          ];
          lua = [
            "stylua"
          ];
          rust = [
            "rustfmt"
          ];
          scala = [
            "scalafmt"
          ];
          sql = [
            "sqlfluff"
          ];
          javascript = [
            "prettierd"
            "prettier"
          ];
          terraform = [
            "terraform_fmt"
          ];
          typescript = [
            "prettierd"
            "prettier"
          ];
          json = [
            "prettierd"
            "prettier"
          ];
          markdown = [
            "prettierd"
            "prettier"
          ];
          nix = [
            "alejandra"
          ];
        };
      };
    };
  };
}
