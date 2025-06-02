{
  vim.languages.markdown = {
    enable = true;

    extensions = {
      render-markdown-nvim.enable = true;
    };

    format.extraFiletypes = ["org"];
  };
}
