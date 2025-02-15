{
  config,
  inputs,
  pkgs,
  ...
}:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light-soft.yaml";
    image = ../../../backrgrounds/light/JapaneseShop.jpg;
    polarity = "light";
  };
}
