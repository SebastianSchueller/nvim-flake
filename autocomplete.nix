{
  config.vim = {
    autocomplete.nvim-cmp = {
      enable = true;
      setupOpts = {
        completion = {
          autocomplete = false;
          completeopt = "menu,menuone,noinsert,preview";
        };
      };
      sources = {
        nvim-cmp = null;
        nvim_lsp = "[LSP]";
        path = "[Path]";
        cmdline = null;
        buffer = "[Buffer]";
      };
    };
  };
}
