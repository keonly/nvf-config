{nix-helpers, ...}: {
  imports = nix-helpers.lib.path.collectImportsList ./.;

  vim.utility.snacks-nvim = {
    enable = true;

    setupOpts.styles = {
      notification = {
        wo.wrap = true;
      };
    };
  };
}
