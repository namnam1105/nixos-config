{ pkgs, ... }:

{
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
        # Insert your packages here please.
        # Or check out home-manager/home-packages.nix
        git
    ];
}