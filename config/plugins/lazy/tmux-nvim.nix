{pkgs, ...}: {
  vim.lazy.plugins."tmux.nvim" = {
    package = pkgs.vimPlugins.tmux-nvim;
    setupModule = "tmux";

    setupOpts = {
      swap.enable_default_keybindings = false;
      copy_sync.enable = false;
    };

    after =
      # lua
      ''
        vim.keymap.set("n", "<C-h>", require("tmux").move_left, {desc = "Tmux move left"})
        vim.keymap.set("n", "<C-j>", require("tmux").move_bottom, {desc = "Tmux move down"})
        vim.keymap.set("n", "<C-k>", require("tmux").move_top, {desc = "Tmux move up"})
        vim.keymap.set("n", "<C-l>", require("tmux").move_right, {desc = "Tmux move right"})
      '';
  };
}
