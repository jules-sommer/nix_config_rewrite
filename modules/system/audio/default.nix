{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib)
    mkIf
    mkEnableOption
    ;
  cfg = config.local.audio;
in
{
  options.local.audio = {
    pipewire = {
      enable = mkEnableOption "Enable pipewire audio support.";
      enableBackCompat = mkEnableOption "Enable jack, alsa, pulse backwards compat.";
    };
  };

  config = {
    environment.systemPackages = mkIf cfg.pipewire.enable (
      with pkgs;
      [
        friture
        sonic-visualiser
        pavucontrol
        pwvucontrol
        helvum
        coppwr
      ]
    );

    # disable pulseaudio if pipewire is enabled
    security.rtkit.enable = true;

    services = {
      pulseaudio.enable = !cfg.pipewire.enable;
      pipewire = {
        inherit (cfg.pipewire) enable;
        wireplumber = { inherit (cfg.pipewire) enable; };

        alsa = {
          enable = cfg.pipewire.enableBackCompat;
          support32Bit = cfg.pipewire.enableBackCompat;
        };

        pulse.enable = cfg.pipewire.enableBackCompat;
        jack.enable = cfg.pipewire.enableBackCompat;
      };
    };
  };
}
