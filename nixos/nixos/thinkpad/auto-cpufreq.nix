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
        platform_profile = "performance";
        turbo = "never";
      };
      battery = {
        governor = "performance";
        energy_performance_preference = "balance_performance";
        turbo = "never";
      };
    };
  };
}
