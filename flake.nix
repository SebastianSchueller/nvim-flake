{
  description = "A very basic flake";
  outputs =
    {
      self,
      nixpkgs,
      nvf,
      neovim-nightly-overlay
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          neovim-nightly-overlay.overlays.default
        ];
      };
      mkNvim =
        {
          pkgs,
          extraModules ? [ ],
        }:
        nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [
            ./settings.nix
            ./mappings.nix
            ./plugins.nix
            ./autocomplete.nix
            ./languages.nix
          ] ++ extraModules;
        };
    in
    {
      inherit mkNvim;
      packages.x86_64-linux.default = (mkNvim { inherit pkgs; }).neovim;
    };
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
