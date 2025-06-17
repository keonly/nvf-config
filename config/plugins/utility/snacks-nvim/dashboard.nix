{
  pkgs,
  lib,
  ...
}: {
  vim.extraPackages = [
    pkgs.krabby
  ];

  vim.utility.snacks-nvim.setupOpts.dashboard = let
    width = 40;
  in {
    inherit width;
    sections =
      lib.generators.mkLuaInline
      # lua
      ''
        {
          function()
            local eevees = {
              vaporeon = 16,
              jolteon = 17,
              flareon = 18,
              espeon = 16,
              umbreon = 15,
              leafeon = 17,
              glaceon = 16,
              sylveon = 17,
            }

            local keys = {}
            for k in pairs(eevees) do
              keys[#keys+1] = k
            end
            local random_eevee = keys[math.random(#keys)]

            return {
              section = "terminal",
              cmd = "krabby name ".. random_eevee .. " --no-title",
              height = eevees[random_eevee],
              indent = (random_eevee == "vaporeon") and 0 or 4,
              padding = 1,
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
}
