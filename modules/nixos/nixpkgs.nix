{ inputs, ... }:
{
  nixpkgs = {
    overlays = with inputs; [
      nur.overlays.default
      elixir-overlay.overlays.default
      (_final: prev: {
        magi = magi.packages.${prev.system}.default;
      })
    ];
  };
}
