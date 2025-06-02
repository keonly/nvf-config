{pkgs, ...}: {
  vim.lazy.plugins."statuscol.nvim" = {
    package = pkgs.vimPlugins.statuscol-nvim;
    setupModule = "statuscol";

    after =
      # lua
      ''
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
          segments = {
            {
              sign = {
                namespace = { "gitsign" },
                maxwidth = 1,
                auto = true,
              },
              click = "v:lua.ScSa",
            },
            {
              text = { builtin.foldfunc, " " },
              click = "v:lua.ScFa",
              hl = "Comment",
            },
            { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
          },
        })
      '';
  };
}
