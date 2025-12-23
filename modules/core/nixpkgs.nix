{ inputs, ... }:
{
  nixpkgs = {
    overlays = with inputs; [
      nur.overlays.default
      elixir-overlay.overlays.default
    ];
  };
}
