{pkgs, ...}: {
  vim.mini = {
    ai.enable = true;
    basics.enable = true;
    bracketed.enable = true;
    comment.enable = true;
    cursorword.enable = true;
    hipatterns.enable = true;
    icons.enable = true;
    move = {
      enable = true;

      setupOpts = {
        mappings = {
          left = "<C-S-h>";
          right = "<C-S-l>";
          down = "<C-S-j>";
          up = "<C-S-k>";

          line_left = "<C-S-h>";
          line_right = "<C-S-l>";
          line_down = "<C-S-j>";
          line_up = "<C-S-k>";
        };
      };
    };
    notify.enable = true;
    pairs.enable = true;
    snippets.enable = true;
    splitjoin.enable = true;
    # statusline.enable = true;
    surround.enable = true;
    trailspace.enable = true;
    visits.enable = true;
  };

  vim.lazy.plugins = {
    "mini-starter" = {
      package = "mini-starter";
      setupModule = "mini.starter";
      after =
        # lua
        ''
          local ascii_art = [[
                ___           ___                       ___
               /\__\         /\__\          ___        /\__\
              /::|  |       /:/  /         /\  \      /::|  |
             /:|:|  |      /:/  /          \:\  \    /:|:|  |
            /:/|:|  |__   /:/__/  ___      /::\__\  /:/|:|__|__
           /:/ |:| /\__\  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\
           \/__|:|/:/  /  |:|  |/:/  / /\/:/  /    \/__/~~/:/  /
               |:/:/  /   |:|__/:/  /  \::/__/           /:/  /
               |::/  /     \::::/__/    \:\__\          /:/  /
               /:/  /       ~~~~         \/__/         /:/  /
               \/__/                                   \/__/

          ]]

          local greetings = function()
            local hour = tonumber(vim.fn.strftime("%H"))
            -- [04:00, 12:00) - morning, [12:00, 20:00) - day, [20:00, 04:00) - evening
            local part_id = math.floor((hour + 4) / 8) + 1
            local day_part = ({ "evening", "morning", "afternoon", "evening" })[part_id]
            local username = vim.loop.os_get_passwd()["username"] or "USERNAME"

            return ("Good %s, %s"):format(day_part, username)
          end

          local curr_time = function()
            local version = vim.version()
            local print_version = "NVIM v" .. version.major .. "." .. version.minor .. "." .. version.patch
            local datetime = os.date("%Y/%m/%d")

            return print_version .. " - " .. datetime
          end

          require("mini.starter").setup({
            header = ascii_art .. greetings(),
            footer = curr_time(),
          })
        '';
    };
  };
}
