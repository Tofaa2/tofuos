{
  configs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    #  Add local pacakaged here
    waydroid
    libresprite
    firefox
    ghostty
    vesktop
    osu-lazer-bin
    spotify
    heroic
    steam
    pandora-launcher
    direnv
    nix-direnv
    nyaa
    qbittorrent
    godot
    pi-coding-agent
    zed-editor
    opencode
    blender
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
