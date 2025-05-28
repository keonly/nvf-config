{pkgs, ...}: {
  vim.lazy.plugins."zellij-nav.nvim" = {
    package = pkgs.vimPlugins.zellij-nav-nvim;
    setupModule = "zellij-nav";

    keys = [
      {
        key = "<C-h>";
        mode = "n";
        action = "<cmd>ZellijNavigateLeftTab<CR>";
      }
      {
        key = "<C-j>";
        mode = "n";
        action = "<cmd>ZellijNavigateDown<CR>";
      }
      {
        key = "<C-k>";
        mode = "n";
        action = "<cmd>ZellijNavigateUp<CR>";
      }
      {
        key = "<C-l>";
        mode = "n";
        action = "<cmd>ZellijNavigateRightTab<CR>";
      }
    ];
  };
}
