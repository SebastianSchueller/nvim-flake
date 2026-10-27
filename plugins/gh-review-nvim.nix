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
        rev = "697b9b5315be53a48af375a488d977c344eead04";
        hash = "sha256-MQpmmYoWEE9unkbqcH4dI1I9kb5as+0HB10MfY7fXeY=";
      };
    })
  ];
}

