{
  vim.languages.markdown = {
    enable = true;

    extensions = {
      markview-nvim.enable = true;
      render-markdown-nvim.enable = true;
    };

    format.extraFiletypes = ["org"];
  };
}
