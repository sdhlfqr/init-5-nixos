{ lib, config, ... }:
let
  makeI18nOption = kind: {
    title = lib.mkOption {
      type = lib.types.str;
      default = null;
    };
  };

  cfg = config.setI18n;
in
{
  options.setI18n = {
    enable = lib.mkEnableOption "Whether to enable setting i18n shorcuts";

    global = makeI18nOption "global";
  };

  config = lib.mkIf cfg.enable {
    i18n.defaultLocale = cfg.global.title;
    i18n.extraLocaleSettings = {
      LC_ADDRESS = cfg.global.title;
      LC_IDENTIFICATION = cfg.global.title;
      LC_MEASUREMENT = cfg.global.title;
      LC_MONETARY = cfg.global.title;
      LC_NAME = cfg.global.title;
      LC_NUMERIC = cfg.global.title;
      LC_PAPER = cfg.global.title;
      LC_TELEPHONE = cfg.global.title;
      LC_TIME = cfg.global.title;
    };
  };
}

