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
        rev = "main";
        hash = "sha256-oMBPSRQFDmJ9Lq+ZP8vFMHaocm4sPX3D/orVMNwVXuM=";
      };
    };
    setup = "require('claudecode').setup{}";
  };
}
