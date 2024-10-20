{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.thermald = {
    enable = true;
  };
  services.auto-cpufreq = {
    enable = true;
    settings = {
      charger = {
        governor = "performance";
        energy_performance_preference = "performance";
        platform_profile = "balanced";
        turbo = "never";
      };
      battery = {
        governor = "powersave";
        energy_performance_preference = "power";
        turbo = "auto";
      };
    };
  };
}
