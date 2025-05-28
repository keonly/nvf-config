{lib, ...}: {
  vim.assistant = {
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

    codecompanion-nvim = {
      enable = true;

      setupOpts = {
        adapters = let
          readApiKey = service: "cmd:cat ~/.secrets/${service}_api_key";
          models = {
            openai = "o3-2025-04-16";
            anthropic = "claude-opus-4-20250514";
          };
        in
          lib.mkLuaInline
          # lua
          ''
            {
              openai = function()
                return require("codecompanion.adapters").extend("openai", {
                  schema = {
                    model = {
                      default = "${models.openai}",
                    },
                  },
                  env = {
                    api_key = "${readApiKey "openai"}"
                  },
                })
              end,
              anthropic = function()
                return require("codecompanion.adapters").extend("anthropic", {
                  schema = {
                    model = {
                      default = "${models.anthropic}",
                    },
                  },
                  env = {
                    api_key = "${readApiKey "anthropic"}"
                  },
              })
              end,
            }
          '';

        strategies = {
          chat = {
            # TODO: Come up with a way to configure the adapter dynamically
            # adapter = "openai";
            adapter = "anthropic";
            keymaps = {
              send = {
                modes = {
                  n = "<C-s>";
                  i = "<C-s>";
                };
              };
              close = {
                modes = {
                  n = "<C-c>";
                  i = "<C-c>";
                };
              };
            };
          };
        };

        display = {
          show_settings = true;
        };

        opts = {
          language = "English";
        };
      };
    };
  };
}
