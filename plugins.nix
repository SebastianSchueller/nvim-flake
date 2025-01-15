{pkgs, ...}: {
  imports = [
    ./plugins/oil.nix
    ./plugins/fzf.nix
  ];
  config.vim = {
    git = {
      enable = true;
      vim-fugitive.enable = true;
      gitsigns.enable = true;
    };
    terminal.toggleterm = {
      enable = true;
      mappings.open = "<A-d>";
      lazygit.enable = true;
    };
    keymaps = [
      {
        key = "<A-d>";
        mode = ["n" "t"];
        action = "<cmd>execute v:count . \"ToggleTerm\"<cr>";
        desc = "Toggle terminal";
      }
    ];
    binds.whichKey.enable = true;
    treesitter = {
      enable = true;
      fold = true;
    };
    extraPlugins = with pkgs.vimPlugins; {
      kitty-navigator = {
        package = vim-kitty-navigator;
      };
      sleuth = {
        package = vim-sleuth;
      };
      inc-rename = {
        package = inc-rename-nvim;
      };
    };
  };
}
