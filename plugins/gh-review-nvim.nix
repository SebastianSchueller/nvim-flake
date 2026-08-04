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
        hash = "sha256-+aZfWAgG4QETbTiiu+VHp7jgaubRqctv+86HxVjwMNA=";
      };
    })
  ];
}

