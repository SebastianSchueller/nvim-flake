{pkgs, ...}: {
  config.vim = {
    extraPlugins = with pkgs.vimPlugins; {
      oil = {
        package = oil-nvim;
        setup = /* lua */ ''
          require "oil".setup({
            default_file_explorer = true;
          })
        '';
      };

    };
    keymaps = [
      {
        key = "-";
        mode = "n";
        action = "<cmd>Oil<cr>";
        desc = "Open parent directory";
      }
    ];
  };
}
