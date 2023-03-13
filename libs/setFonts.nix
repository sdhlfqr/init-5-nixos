{ lib, config, ... }:
let
  makeFontsOption = kind: {
    title = lib.mkOption {
      type = lib.types.str;
      default = null;
      description = "Family title for ${kind} font profile";
      example = "Fira Code";
    };

    package = lib.mkOption {
      type = lib.types.package;
      default = null;
      description = "Package for ${kind} font profile";
      example = "pkgs.fira-code";
    };
  };

  cfg = config.setFonts;
in
{
  options.setFonts = {
    enable = lib.mkEnableOption "Whether to enable font profiles";

    regular = makeFontsOption "regular";
    monospace = makeFontsOption "monospace";
  };

  config = lib.mkIf cfg.enable {
    fonts.fonts = [ cfg.regular.package cfg.monospace.package ];

    fonts.enableDefaultFonts = true;
    fonts.fontconfig.enable = true;
    fonts.fontconfig = {
      defaultFonts = {
        serif = [ cfg.regular.title ];
        sansSerif = [ cfg.regular.title ];
        monospace = [ cfg.monospace.title ];
      };
    };
  };
}
