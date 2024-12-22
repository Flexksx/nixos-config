# fonts.nix
{ pkgs, ... }:

{
  fonts = {

    fontconfig = {
      enable = true;
      antialias = true;
      hinting = {
        enable = true;
        style = "slight";
      };
      subpixel = {
        lcdfilter = "default";
        rgba = "rgb";
      };

      defaultFonts = {
        serif = [
          "Liberation Serif"
          "Noto Serif"
        ];
        sansSerif = [
          "Ubuntu"
          "Vazirmatn"
        ];
        monospace = [
          "Cascadia Code"
          "Fira Code"
          "Droid Sans Mono"
        ];
      };
    };
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "DroidSansMono"
        ];
      })
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      font-awesome
      fira
      libertine
      source-serif-pro
      stix-two
      vistafonts
      material-icons
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      meslo-lgs-nf
      cascadia-code
    ];
  };
}
