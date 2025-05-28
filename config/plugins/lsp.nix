{
  vim.lsp = {
    enable = true;

    inlayHints.enable = true;
    lightbulb = {
      enable = true;

      setupOpts = let
        commonTexts = {
          text = "󰌶 ";
          lens_text = " ";
        };
      in {
        sign = commonTexts;
        virtual_text = commonTexts;
        float = commonTexts;
        status_text = commonTexts;
      };
    };
    lspconfig.enable = true;

    mappings = {
      # Workspace
      addWorkspaceFolder = "<leader>lwa";
      removeWorkspaceFolder = "<leader>lwr";

      # Goto ...
      goToDefinition = "<leader>lgd";
      goToType = "<leader>lgt";

      # List
      listDocumentSymbols = "<leader>lS";
      listImplementations = "<leader>lI";
      listReferences = "<leader>lR";
      listWorkspaceFolders = "<leader>lwf";
      listWorkspaceSymbols = "<leader>lws";

      # Diagnostics
      nextDiagnostic = "<leader>lgn";
      previousDiagnostic = "<leader>lgp";
      openDiagnosticFloat = "<leader>le";

      renameSymbol = "<leader>ln";
      signatureHelp = "<leader>ls";
      documentHighlight = "<leader>lH";

      codeAction = "<leader>ca";
      format = "<leader>cf";
    };

    otter-nvim = {
      enable = true;

      mappings.toggle = "<leader>lo";

      setupOpts = {
        handle_leading_whitespace = true;
      };
    };

    trouble = {
      enable = true;

      mappings = {
        # Diagnostics
        documentDiagnostics = "<leader>ld";
        workspaceDiagnostics = "<leader>lwd";

        locList = "<leader>xl";
        quickfix = "<leader>xq";
        symbols = "<leader>xs";
      };
    };
  };
}
