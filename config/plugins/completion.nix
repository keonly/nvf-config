{
  vim.autocomplete = {
    blink-cmp = {
      enable = true;
      friendly-snippets.enable = true;
      mappings = {
        next = "<C-j>";
        previous = "<C-k>";
      };

      sourcePlugins = {
        # blink-compat.enable = true;
        # blink-emoji-nvim.enable = true;
        # blink-ripgrep-nvim.enable = true;
        # blink-cmp-spell.enable = true;

        emoji.enable = true;
        ripgrep.enable = true;
        spell.enable = true;
      };
    };
  };
}
