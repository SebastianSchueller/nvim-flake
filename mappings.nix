{
  config.vim = {
    keymaps = [
      {
        key = "<c-n>";
        mode = "n";
        action = "<cmd>nohlsearch<cr>";
        desc = "Stop highlighting the current search";
      }
    ];
  };
}
