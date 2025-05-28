{nix-helpers, ...}: {
  imports = nix-helpers.lib.path.collectImportsList ./.;
}
