{
  configs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    #  Add local pacakaged here
    firefox
    wezterm
    vesktop
    osu-lazer-bin
    spotify
    heroic
    steam
    jetbrains.idea-oss
    pandora-launcher
  ];
  # Add host specific flatpaks here
  services = {
    flatpak = {
      packages = [
        "org.vinegarhq.Sober"
      ];
    };
  };

  services.auto-cpufreq.enable = false;
  services.auto-cpufreq.settings = {
    battery = {
      governor = "powersave";
      turbo = "never";
    };
    charger = {
      governor = "performance";
      turbo = "auto";
    };
  };
}
