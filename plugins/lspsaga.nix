{pkgs, lib, ...}: 
let
  inherit (lib.modules) mkMerge;
  inherit (lib.nvim.binds) mkSetLuaBinding;
in
{
  config.vim = {
    extraPlugins = with pkgs.vimPlugins; {
      lspsaga-nvim = {
        package = lspsaga-nvim;
        setup = /* lua */ ''
          require('lspsaga').setup({
            code_action_prompt = {
              enable = false
            },
          })
        '';
      };
    };
    startPlugins = ["lspsaga-nvim"];

    maps = let
      mkBinding = desc: map: action:
        mkSetLuaBinding { value = map; description = desc; } action;
    in {
    #   visual = mkBinding "Code action [LSPSaga]" "<leader>ca" "require('lspsaga.codeaction').range_code_action";
      normal = mkMerge [
        (mkBinding "Rename [LSPSaga]" "<leader>lr" "require('lspsaga.rename').rename")
      ];
    };
  };
}
