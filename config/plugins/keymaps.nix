{lib, ...}: let
  windowsKeymaps = [
    {
      key = "<leader>s|";
      mode = "n";
      action = "<cmd>vsplit<CR>";
    }
    {
      key = "<leader>s-";
      mode = "n";
      action = "<cmd>split<CR>";
    }
  ];

  indentKeymaps = lib.lists.map (
    key: {
      inherit key;
      mode = "v";
      action = key + "gv";
    }
  ) ["<" ">"];

  bufferKeymaps = [
    {
      key = "<leader>tw";
      mode = "n";
      action = "<cmd>set invwrap<CR>";
    }
  ];
in {
  vim.keymaps = builtins.concatLists [
    windowsKeymaps
    indentKeymaps
    bufferKeymaps
  ];
}
