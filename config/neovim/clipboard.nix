{pkgs, ...}: {
  vim.clipboard = {
    enable = true;

    providers = {
      wl-copy.enable =
        if pkgs.stdenv.isDarwin
        then false
        else true;
    };
    registers = "unnamedplus";
  };
}
