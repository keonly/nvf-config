{
  vim.git = {
    enable = true;

    git-conflict = {
      enable = true;

      mappings = {
        # Choose
        ours = "<leader>gco";
        theirs = "<leader>gct";
        both = "<leader>gcb";
        none = "<leader>gcx";

        # Move between conflicts
        nextConflict = "]x";
        prevConflict = "[x";
      };
    };

    gitlinker-nvim.enable = true;

    gitsigns = {
      enable = true;

      mappings = {
        toggleBlame = "<leader>tgb";
        toggleDeleted = "<leader>tgd";
        diffProject = "<leader>gpd";
        diffThis = "<leader>gtd";
      };
    };
  };
}
