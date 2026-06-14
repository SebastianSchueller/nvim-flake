{pkgs, ...}: {
  config.vim = {
    extraPlugins = with pkgs.vimPlugins; {
      smart-splits-nvim = {
        package = smart-splits-nvim;
        setup = /* lua */ ''
          require('smart-splits').setup({})
        '';
      };

    };
    keymaps = [
      {
        key = "<c-k>";
        mode = "n";
        lua = true;
        action = "require('smart-splits').move_cursor_up";
        desc = "Move one split/pane up";
      }
      {
        key = "<c-j>";
        mode = "n";
        lua = true;
        action = "require('smart-splits').move_cursor_down";
        desc = "Move one split/pane down";
      }
      {
        key = "<c-l>";
        mode = "n";
        lua = true;
        action = "require('smart-splits').move_cursor_right";
        desc = "Move one split/pane right";
      }
      {
        key = "<c-h>";
        mode = "n";
        lua = true;
        action = "require('smart-splits').move_cursor_left";
        desc = "Move one split/pane left";
      }
    ];
  };
}
