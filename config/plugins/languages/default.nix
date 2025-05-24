{nix-helpers, ...}: {
  imports = nix-helpers.lib.path.collectImportsList ./.;

  vim.languages = {
    enableDAP = true;
    enableExtraDiagnostics = true;
    enableFormat = true;
    enableTreesitter = true;
  };
}
