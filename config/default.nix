{
  pkgs,
  lib,
  nix-helpers,
  ...
}: {
  imports = nix-helpers.lib.path.collectImportsList ./.;

  vim = {
    viAlias = true;
    vimAlias = true;
    enableLuaLoader = true;
  };
}
