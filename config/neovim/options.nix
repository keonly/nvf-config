{
  vim = {
    options = {
      # Tab / Indentation
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;
      expandtab = true;
      smartindent = true;
      wrap = false;
      textwidth = 0;
      linebreak = true;

      # Search
      incsearch = true;
      ignorecase = true;
      smartcase = true;
      hlsearch = false;

      # Appearance
      numberwidth = 3;
      number = true;
      relativenumber = true;
      termguicolors = true;
      colorcolumn = "80";
      signcolumn = "yes";
      cmdheight = 1;
      scrolloff = 10;
      completeopt = "menuone,noinsert,noselect";
      showmode = false;
      conceallevel = 1;
      cursorline = true;
      cursorlineopt = "number";
      winborder = "rounded";

      # Fold
      foldcolumn = "1";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;
      fillchars = "eob:\ ,fold:\ ,foldopen:,foldsep:\ ,foldclose:";

      # Behaviour
      swapfile = false;
      backup = false;
      undofile = true;
      backspace = "indent,eol,start";
      splitright = true;
      splitbelow = true;
      autochdir = false;
      modifiable = true;
      encoding = "UTF-8";
      timeoutlen = 1000;
    };

    globals = {
      loaded_netrwPlugin = 1;
    };
  };
}
