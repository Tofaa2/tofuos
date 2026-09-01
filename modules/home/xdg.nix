{pkgs, host, lib, ...}: let
  vars = import ../../hosts/${host}/variables.nix;
in {
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      # If the host defines mimeDefaultApps in hosts/${host}/variables.nix,
      # use it to set per-host default applications.
      # defaultApplications = lib.mkIf (vars ? mimeDefaultApps) vars.mimeDefaultApps;

       # Example: set default handlers for MIME types and URL schemes.
       # Uncomment the block below and adjust .desktop IDs to your preferred apps.
       defaultApplications = {
         # PDFs
         "application/pdf" = ["okular.desktop"];      # change to your preferred reader
         "application/x-pdf" = ["okular.desktop"];    # legacy alias
      
         # Web browser
         "x-scheme-handler/http"  = ["firefox.desktop"];  
         "x-scheme-handler/https" = ["firefox.desktop"];
         "text/html"              = ["firefox.desktop"];
      
         # Text files
         "text/plain" = ["zed.desktop"];             # or code.desktop, org.gnome.TextEditor.desktop
      
         # Images and video
         "image/png" = ["imv.desktop"];               # or org.gnome.eog.desktop
         "video/mp4" = ["mpv.desktop"];               # or vlc.desktop
      
         # Archives
         "application/zip" = ["org.gnome.FileRoller.desktop"]; # or xarchiver.desktop, peazip.desktop
      
         # Folders (file manager)
         "inode/directory" = ["thunar.desktop"];      # or org.gnome.Nautilus.desktop, org.kde.dolphin.desktop
       };
    };
    portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-hyprland];
      configPackages = [pkgs.hyprland];
    };
  };
}
