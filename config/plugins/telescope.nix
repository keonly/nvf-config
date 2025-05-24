{
  vim.telescope = {
    enable = true;

    mappings = {
      buffers = "<leader>fb";
      diagnostics = "<leader>fld";
      findFiles = "<leader>ff";
      findProjects = "<leader>fp";
      gitBranches = "<leader>fvb";
      gitCommits = "<leader>fvc";
      gitStash = "<leader>fvs";
      liveGrep = "<leader>fg";
      lspDefinitions = "<leader>flD";
      lspDocumentSymbols = "<leader>flsb";
      lspImplementations = "<leader>fli";
      lspReferences = "<leader>flr";
      lspTypeDefinitions = "<leader>flt";
      lspWorkspaceSymbols = "<leader>flsw";
      open = "<leader>ft";
      resume = "<leader>fr";
      treesitter = "<leader>fs";
    };

    setupOpts = {
      defaults = {
        mappings = {
          i = {
            "<C-j>" = "move_selection_next";
            "<C-k>" = "move_selection_previous";
          };
        };
      };
    };
  };
}
