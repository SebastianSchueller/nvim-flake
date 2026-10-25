{ pkgs, ... }:
{
  vim.extraPackages = [ pkgs.claude-code ];
  vim.extraPlugins.claudecode = {
    package = pkgs.vimUtils.buildVimPlugin {
      pname = "claudecode-nvim";
      version = "unstable";
      src = pkgs.fetchFromGitHub {
        owner = "coder";
        repo = "claudecode.nvim";
        rev = "c0deb41a0c6ac74c620be0a683aa9834e535c84a";
        hash = "sha256-DnwtpsIszWXPwSrCgXhp8gb7F7uoL/9Ecl77DAf6qos=";
      };
    };
    setup = "require('claudecode').setup{}";
  };
}
