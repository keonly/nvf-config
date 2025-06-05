{lib, ...}: {
  vim.utility.snacks-nvim.setupOpts.dashboard = {
    preset.header = builtins.concatStringsSep "\n" [
      "        ___           ___                       ___         "
      "       /\\__\\         /\\__\\          ___        /\\__\\        "
      "      /::|  |       /:/  /         /\\  \\      /::|  |       "
      "     /:|:|  |      /:/  /          \\:\\  \\    /:|:|  |       "
      "    /:/|:|  |__   /:/__/  ___      /::\\__\\  /:/|:|__|__     "
      "   /:/ |:| /\\__\\  |:|  | /\\__\\  __/:/\\/__/ /:/ |::::\\__\\    "
      "   \\/__|:|/:/  /  |:|  |/:/  / /\\/:/  /    \\/__/~~/:/  /    "
      "       |:/:/  /   |:|__/:/  /  \\::/__/           /:/  /     "
      "       |::/  /     \\::::/__/    \\:\\__\\          /:/  /      "
      "       /:/  /       ~~~~         \\/__/         /:/  /       "
      "       \\/__/                                   \\/__/        "
    ];
    sections =
      lib.generators.mkLuaInline
      # lua
      ''
        {
          {section = "header"},
          function()
            local hour = tonumber(vim.fn.strftime('%H'))
            local part_id = math.floor((hour + 4) / 8) + 1
            local day_part = ({ 'evening', 'morning', 'afternoon', 'evening' })[part_id]
            local username = vim.loop.os_getenv('USER_ALIAS_NAME') or vim.loop.os_get_passwd()['username'] or 'user'
            return {
              align = 'center',
              text = { ('Good %s, %s'):format(day_part, username), hl = 'header', padding = 1 },
            }
          end,
          { text = { "" } },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { text = { "" } },
          function()
            local version = vim.version()
            local print_version = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
            local datetime = os.date("%Y/%m/%d")

            return {
              align = 'center',
              text = { (' %s -  %s'):format(print_version, datetime), hl = 'Nontext', padding = 1 }
            }
          end,
        }
      '';
  };
}
