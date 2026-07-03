{ inputs, ... }:
{
  nixpkgs = {
    overlays = with inputs; [
      nur.overlays.default
      elixir-overlay.overlays.default
      (_final: prev: {
        magi = magi.packages.${prev.stdenv.hostPlatform.system}.default;
      })
      (final: _prev: {
        dexter = final.callPackage ../../pkgs/dexter.nix { src = inputs.dexter-src; };
      })
    ];
  };
}
