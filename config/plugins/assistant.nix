{
  vim.assistant = {
    avante-nvim = {
      enable = true;

      setupOpts = {
        provider = "claude";
        auto_suggestions_provider = "claude";

        behaviour = {
          enable_claude_text_editor_tool_mode = true;
          enable_cursor_planning_mode = true;
          enable_token_counting = true;
          auto_apply_diff_after_generation = true;
          auto_suggestions = true;
        };

        mappings = {
          diff = {
            ours = "co";
            theirs = "ct";
            all_theirs = "ca";
            both = "cb";
            cursor = "cc";
            next = "]x";
            prev = "[x";
          };
          suggestion = {
            accept = "<M-l>";
            next = "<M-]>";
            prev = "<M-[>";
            dismiss = "<C-]>";
          };
          jump = {
            next = "]]";
            prev = "[[";
          };
          submit = {
            normal = "<CR>";
            insert = "<C-s>";
          };
          cancel = {
            normal = ["<C-c>" "<Esc>" "q"];
            insert = ["<C-c>"];
          };
          sidebar = {
            apply_all = "A";
            apply_cursor = "a";
            retry_user_request = "r";
            edit_user_request = "e";
            switch_windows = "<Tab>";
            reverse_switch_windows = "<S-Tab>";
            remove_file = "d";
            add_file = "@";
            close = ["<Esc>" "q"];
            close_from_input = {
              normal = "<Esc>";
              insert = "<C-d>";
            };
          };
        };
      };
    };

    copilot = {
      enable = true;

      cmp.enable = true;
      setupOpts = {
        panel = {
          enabled = true;
          auto_refresh = true;
          layout = {
            position = "right";
            ratio = 0.3;
          };
        };
      };
    };
  };
}
