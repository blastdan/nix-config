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

        tfenv.url = "github:cjlarose/tfenv-nix";

	# Hardware Configuration
        nixos-hardware = {
          url = "github:nixos/nixos-hardware";
        };

        nix-ld-rs = {
          url = "github:nix-community/nix-ld-rs";
          inputs.nixpkgs.follows = "nixpkgs";
        };

        # Hyprland
        hyprland = {
          url = "github:hyprwm/Hyprland";
          inputs.nixpkgs.follows = "nixpkgs";
        };

        bibata-cursors = {
          url = "github:suchipi/Bibata_Cursor";
          flake = false;
        };

        vscode-server.url = "github:nix-community/nixos-vscode-server";
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
            
            overlays = with inputs; [
              tfenv.overlays.default
            ];

            channels-config = {
              allowUnfree = true;
            };
            
            # Add modules to all NixOS systems.
            systems.modules.nixos = with inputs; [
              # my-input.nixosModules.my-module
            ];
            # Add modules to a specific system.
            systems.hosts.winamp.modules = with inputs; [
              vscode-server.nixosModules.default
            ];
        };
}
