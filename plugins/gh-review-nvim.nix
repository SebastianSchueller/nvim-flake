{ pkgs, ...}:
{
  vim.extraPackages = [ pkgs.gh ];
  vim.startPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "gh-review-nvim";
      version = "unstable-2026-02-15";
      src = pkgs.fetchFromGitHub {
        owner = "gh-tui-tools";
        repo = "gh-review.nvim";
        rev = "main";
        hash = "sha256-NMvEtel/zWg0doitmipPj38M5Q2xFdad7oZCEAfzl+M=";
      };
    })
  ];
}

