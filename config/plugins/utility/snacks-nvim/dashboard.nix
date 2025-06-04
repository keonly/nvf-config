{
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
    sections = [
      {section = "header";}
      {
        section = "terminal";
        cmd =
          # bash
          ''
            #!/bin/sh

            hour=$(date +"%H")
            hour=$((10#$hour))

            part_id=$(( (hour + 4) / 8 + 1 ))

            case $part_id in
              1) day_part="evening" ;;
              2) day_part="morning" ;;
              3) day_part="afternoon" ;;
              4) day_part="evening" ;;
            esac

            username=$(printf "%.4s" "$(whoami 2>/dev/null || echo USERNAME)")
            greeting=$(printf "Good %s, %s" "$day_part" "$username")

            case $day_part in
              morning|evening) greeting_len=18 ;;
              afternoon)       greeting_len=20 ;;
            esac

            total_width=60
            pad=$(( (total_width - greeting_len) / 2 ))

            printf "%*s%s%*s\n" "$pad" "" "$greeting" "$((total_width - pad - greeting_len))" ""
          '';
        hl = "header";
        height = 2;
        padding = 1;
      }
      {
        icon = " ";
        title = "Keymaps";
        section = "keys";
        indent = 2;
        padding = 1;
      }
      {
        icon = " ";
        title = "Recent Files";
        section = "recent_files";
        indent = 2;
        padding = 1;
      }
      {
        icon = " ";
        title = "Projects";
        section = "projects";
        indent = 2;
        padding = 1;
      }
      {
        section = "terminal";
        cmd =
          # bash
          ''
            #!/bin/sh

            nvim_version=$(nvim --version | head -n 1 | awk '{print $2}')
            print_version=" $nvim_version"

            datetime=$(date +"%Y/%m/%d")
            print_datetime=" $datetime"

            greeting="$print_version - $print_datetime" # 9 + 3 + 12 = 24 chars
            greeting_len=24
            total_width=60
            pad=$(( (total_width - greeting_len) / 2 ))

            printf "\n%*s%s%*s" "$pad" "" "$greeting" "$((total_width - pad - greeting_len))" ""
          '';
        hl = "NonText";
        height = 2;
        padding = 1;
      }
    ];
  };
}
