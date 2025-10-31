{ pkgs, inputs, ... }:
{
  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
    ];
  };
}
