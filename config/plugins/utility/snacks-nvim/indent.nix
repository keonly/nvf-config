{
  vim.utility.snacks-nvim.setupOpts.indent = {
    enabled = true;

    animate = {
      duration = {
        step = 10;
        total = 200;
      };
    };

    scope = {
      enabled = true;
      hl = "LineNr";
      underline = true;
    };
  };
}
