{pkgs, ...}: {
  vim.autocomplete = {
    blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
      mappings = {
        next = "<C-j>";
        previous = "<C-k>";
      };

      sourcePlugins = {
        emoji.enable = true;
        ripgrep.enable = true;
        spell.enable = true;
        blink-cmp-avante = {
          enable = true;
          package = pkgs.vimPlugins.blink-cmp-avante;
          module = "blink-cmp-avante";
        };
      };

      setupOpts = {
        completion = {
          menu.border = "rounded";
          documentation.window.border = "rounded";
          signature.window.border = "rounded";
        };
      };
    };
  };
}
