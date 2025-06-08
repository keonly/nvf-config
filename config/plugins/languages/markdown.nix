{
  vim.languages.markdown = {
    enable = true;

    extensions = {
      render-markdown-nvim = {
        enable = true;

        setupOpts.file_types = ["markdown" "Avante"];
      };
    };

    format.extraFiletypes = ["org"];
  };
}
