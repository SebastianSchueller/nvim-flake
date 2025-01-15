{pkgs, ...}: {
  config.vim = {
    extraPlugins = with pkgs.vimPlugins; {
      fzf = {
        package = fzf-lua;
        setup = /* lua */ ''
          local fzf = require "fzf-lua"
          fzf.setup({
            fzf_opts = {
              ["--history"] = '$HOME/.fzf-lua.history',
            },
          })
          fzf.register_ui_select({})
        '';
      };
    };
    keymaps = [
      {
        key = "<c-p>";
        mode = "n";
        action = "<cmd>FzfLua files<cr>";
        desc = "Open file search";
      }
      {
        key = "<c-b>";
        mode = "n";
        action = "<cmd>FzfLua buffers<cr>";
        desc = "Open buffer search";
      }
      {
        key = "<c-s>l";
        mode = "n";
        action = "<cmd>FzfLua live_grep<cr>";
        desc = "Open text search";
      }
      {
        key = "<c-s>w";
        mode = "n";
        action = "<cmd>FzfLua grep_cword<cr>";
        desc = "Open search for word under cursor";
      }
    ];
  };
}
