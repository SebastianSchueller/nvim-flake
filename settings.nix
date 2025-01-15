{
  config.vim = {
    searchCase = "smart";
    lineNumberMode = "none";
    spellcheck = {
      enable = true;
      languages = [ "en" "de" ];
    };
    options = {
      inccommand = "split";
      showmode = false;
      splitbelow = true;
      splitright = true;
      wrap = false;
      signcolumn = "yes";
      statusline = "%<%{getcwd()} %<%f %h%m%r%=%-14.(%l,%c%V%) %P";
    };
  };
}
