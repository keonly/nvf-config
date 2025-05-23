{
  lib,
  nix-helpers,
  ...
}: {
  imports = nix-helpers.lib.path.collectImportsList ./.;

  # _module.args.extraLib = import ../lib {inherit nix-helpers;};

  vim = {
    viAlias = true;
    vimAlias = true;
    enableLuaLoader = true;
  };
}
