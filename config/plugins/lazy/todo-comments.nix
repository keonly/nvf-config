{
  vim.lazy.plugins."todo-comments-nvim" = {
    package = "todo-comments-nvim";
    setupModule = "todo-comments";
    event = [
      {
        event = "User";
        pattern = "LazyFile";
      }
    ];

    after =
      # lua
      ''
        vim.keymap.set("n", "]t", function()
          require("todo-comments").jump_next()
        end, { desc = "Next todo comment" })

        vim.keymap.set("n", "[t", function()
          require("todo-comments").jump_prev()
        end, { desc = "Previous todo comment" })

        vim.keymap.set("n", "<leader>st", function()
          require("snacks").picker.todo_comments()
        end, { desc = "Todo" })

        vim.keymap.set("n", "<leader>sT", function()
          require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
        end, { desc = "Todo/Fix/Fixme" })
      '';
  };
}
