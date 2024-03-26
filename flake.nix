{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";

        # NixPkgs Unstable (nixos-unstable)
        unstable.url = "github:nixos/nixpkgs/nixos-unstable";

        # Snowfall Lib
        snowfall-lib.url = "github:snowfallorg/lib/dev";
        snowfall-lib.inputs.nixpkgs.follows = "nixpkgs";

        home-manager.url = "github:nix-community/home-manager/release-23.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
 
        nixos-wsl.url = "github:nix-community/nixos-wsl";

        # Hyprland
        hyprland = {
          url = "github:hyprwm/Hyprland";
          inputs.nixpkgs.follows = "nixpkgs";
        };

        bibata-cursors = {
          url = "github:suchipi/Bibata_Cursor";
          flake = false;
        };
    };

    outputs = inputs: let
        lib = inputs.snowfall-lib.mkLib {
            inherit inputs;
            src = ./.;

            # Configure Snowfall Lib, all of these settings are optional.
            snowfall = {
                # Choose a namespace to use for your flake's packages, library,
                # and overlays.
                namespace = "blastdan";

                # Add flake metadata that can be processed by tools like Snowfall Frost.
                meta = {
                    # A slug to use in documentation when displaying things like file paths.
                    name = "blastdan";

                    # A title to show for your flake, typically the name.
                    title = "blatdan";
                };
            };
        };
    in 
        lib.mkFlake {
            channels-config = {
              allowUnfree = true;
          };
        };
}
