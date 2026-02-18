{ pkgs, ... }:
{
  config.vim = {
    options = {
      formatexpr = "v:lua.vim.lsp.formatexpr()";
    };
    visuals.nvim-web-devicons.enable = true;
    lsp = {
      enable = true;
      lightbulb.enable = false;
      lspSignature = {
        enable = true;
        setupOpts = {
          toggleKey = "<M-k>";
          select_signature_key = "<M-n>";
          hint_prefix = ">>";
        };
      };
      # NVF doesn't have an option to disable the codeaction
      # lightbulbs. So for now, add it as a custom Plugin.
      lspsaga = {
        enable = false;
      };
    };
    extraPackages = with pkgs; [
      nixfmt
    ];
    languages = {
      enableDAP = true;
      enableFormat = true;
      enableTreesitter = true;
      nix = {
        enable = true;
        extraDiagnostics.enable = false;
        format = {
          type = "nixfmt";
        };
        lsp.enable = true;
      };
      clang = {
        enable = true;
        cHeader = true;
        lsp.enable = true;
      };
      python.enable = true;
      markdown.enable = true;
      bash.enable = true;
    };
  };
}
