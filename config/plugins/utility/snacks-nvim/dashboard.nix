{lib, ...}: {
  vim.utility.snacks-nvim.setupOpts.dashboard = let
    width = 30;
  in {
    inherit width;
    sections =
      lib.generators.mkLuaInline
      # lua
      ''
        {
          function()
            local handle = io.popen("curl -s 'wttr.in/?MQT0'")
            local weather = handle and handle:read("*a") or "wttr.in unavailable! :("
            if handle then handle:close() end

            return {
              text = {
                weather .. "\n",
                padding = 1,
              },
            }
          end,
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
          { text = { "\n" } },
          {
            section = "keys",
            padding = 2,
          },
          function()
            local version = vim.version()
            local print_version = "v" .. version.major .. "." .. version.minor .. "." .. version.patch
            local date = os.date("%Y/%m/%d")

            return {
              align = 'center',
              text = {
                { ' ', hl = 'SnacksDashboardNormal' },
                { print_version, hl = 'NonText' },
                { '    ', hl = 'SnacksDashboardNormal' },
                { date, hl = 'NonText' },
              };
            }
          end,
        }
      '';
  };

  vim.highlight = {
    SnacksDashboardIcon = {
      fg = "#f4f4f4";
      bold = true;
    };
    SnacksDashboardDesc = {fg = "#c6c6c6";};
    SnacksDashboardKey = {
      fg = "#f4f4f4";
      bold = true;
    };
  };
}
