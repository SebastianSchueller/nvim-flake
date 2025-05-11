{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nvf,
    }:
    let
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
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
            # ./autocomplete.nix
            # ./languages.nix
          ] ++ extraModules;
        };
    in
    {
      inherit mkNvim;
      packages.x86_64-linux.default = (mkNvim { inherit pkgs; }).neovim;
    };
}
