{lib, ...}: {
  vim.utility.snacks-nvim.setupOpts.picker = {
    enabled = true;

    win = {
      input = {
        keys = {
          "s" = ["flash"];
        };
      };
    };

    actions = {
      flash =
        lib.generators.mkLuaInline
        # lua
        ''
          function(picker)
            require("flash").jump({
              pattern = "^",
              label = { after = { 0, 0 } },
              search = {
                mode = "search",
                exclude = {
                  function(win)
                    return vim.bo[vim.api.nvim_win_get_buf(win)].filetype ~= "snacks_picker_list"
                 end,
                },
              },
              action = function(match)
                local idx = picker.list:row2idx(match.pos[1])
                picker.list:_move(idx, true, true)
             end,
            })
         end
        '';
    };
  };

  vim.keymaps = [
    # ─── Top Pickers & Explorer ──────────────────────────────────────────────────
    {
      key = "<leader><space>";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.smart";
      desc = "Smart Find Files";
    }
    {
      key = "<leader>,";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.buffers";
      desc = "Buffers";
    }
    {
      key = "<leader>/";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.grep";
      desc = "Grep";
    }
    {
      key = "<leader>:";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.command_history";
      desc = "Command History";
    }
    {
      key = "<leader>n";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.notifications";
      desc = "Notification History";
    }
    {
      key = "<leader>e";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.explorer";
      desc = "File Explorer";
    }

    # ─── Find (files / projects / git) ───────────────────────────────────────────
    {
      key = "<leader>fb";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.buffers";
      desc = "Buffers";
    }
    {
      key = "<leader>ff";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.files";
      desc = "Find Files";
    }
    {
      key = "<leader>fg";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.git_files";
      desc = "Find Git Files";
    }
    {
      key = "<leader>fp";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.projects";
      desc = "Projects";
    }
    {
      key = "<leader>fr";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.recent";
      desc = "Recent";
    }

    # ─── Git pickers -------------------------------------------------------------
    {
      key = "<leader>gb";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.git_branches";
      desc = "Git Branches";
    }
    {
      key = "<leader>gl";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.git_log";
      desc = "Git Log";
    }
    {
      key = "<leader>gL";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.git_log_line";
      desc = "Git Log Line";
    }
    {
      key = "<leader>gs";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.git_status";
      desc = "Git Status";
    }
    {
      key = "<leader>gS";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.git_stash";
      desc = "Git Stash";
    }
    {
      key = "<leader>gd";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.git_diff";
      desc = "Git Diff (Hunks)";
    }
    {
      key = "<leader>gf";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.git_log_file";
      desc = "Git Log File";
    }

    # ─── Grep / Search ──────────────────────────────────────────────────────────
    {
      key = "<leader>sb";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.lines";
      desc = "Buffer Lines";
    }
    {
      key = "<leader>sB";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.grep_buffers";
      desc = "Grep Open Buffers";
    }
    {
      key = "<leader>sg";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.grep";
      desc = "Grep";
    }
    {
      key = "<leader>sw";
      mode = ["n" "x"];
      lua = true;
      action = "require('snacks').picker.grep_word";
      desc = "Visual selection or word";
    }
    {
      key = "<leader>s'";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.registers";
      desc = "Registers";
    }
    {
      key = "<leader>s/";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.search_history";
      desc = "Search History";
    }
    {
      key = "<leader>sa";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.autocmds";
      desc = "Autocmds";
    }
    {
      key = "<leader>sc";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.command_history";
      desc = "Command History";
    }
    {
      key = "<leader>sC";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.commands";
      desc = "Commands";
    }
    {
      key = "<leader>sd";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.diagnostics";
      desc = "Diagnostics";
    }
    {
      key = "<leader>sD";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.diagnostics_buffer";
      desc = "Buffer Diagnostics";
    }
    {
      key = "<leader>sh";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.help";
      desc = "Help Pages";
    }
    {
      key = "<leader>sH";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.highlights";
      desc = "Highlights";
    }
    {
      key = "<leader>si";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.icons";
      desc = "Icons";
    }
    {
      key = "<leader>sj";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.jumps";
      desc = "Jumps";
    }
    {
      key = "<leader>sk";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.keymaps";
      desc = "Keymaps";
    }
    {
      key = "<leader>sl";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.loclist";
      desc = "Location List";
    }
    {
      key = "<leader>sm";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.marks";
      desc = "Marks";
    }
    {
      key = "<leader>sM";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.man";
      desc = "Man Pages";
    }
    {
      key = "<leader>sq";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.qflist";
      desc = "Quickfix List";
    }
    {
      key = "<leader>sR";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.resume";
      desc = "Resume";
    }
    {
      key = "<leader>su";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.undo";
      desc = "Undo History";
    }

    # ─── LSP pickers ────────────────────────────────────────────────────────────
    {
      key = "gd";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.lsp_definitions";
      desc = "Goto Definition";
    }
    {
      key = "gD";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.lsp_declarations";
      desc = "Goto Declaration";
    }
    {
      key = "gr";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.lsp_references";
      desc = "References";
      nowait = true;
    }
    {
      key = "gI";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.lsp_implementations";
      desc = "Goto Implementation";
    }
    {
      key = "gy";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.lsp_type_definitions";
      desc = "Goto T[y]pe Definition";
    }
    {
      key = "<leader>ss";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.lsp_symbols";
      desc = "LSP Symbols";
    }
    {
      key = "<leader>sS";
      mode = "n";
      lua = true;
      action = "require('snacks').picker.lsp_workspace_symbols";
      desc = "LSP Workspace Symbols";
    }
  ];
}
