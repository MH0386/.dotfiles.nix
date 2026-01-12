{ pkgs, ... }:
{
  services = {
    iio-niri.enable = true;
    vnstat.enable = true;
    pulseaudio.enable = false;
    avahi = {
      enable = true;
      publish.enable = true;
    };
    flatpak = {
      enable = true;
      uninstallUnmanaged = true;
      update.onActivation = true;
      packages = [
        #     "io.github._0xzer0x.qurancompanion"
        #     "io.github.ladaapp.lada"
        #     "io.github.giantpinkrobots.flatsweep"
        #     "io.github.lo2dev.Echo"
        #     "app.fotema.Fotema"
        #     "io.github.sigmasd.stimulator"
        #     # "com.jeffser.Alpaca"
        #     "dev.skynomads.Seabird"
        #     "org.nickvision.tubeconverter"
        #     "com.github.gijsgoudzwaard.image-optimizer"
        #     "fr.handbrake.ghb"
        #     "io.github.seadve.Kooha"
        #     "org.onlyoffice.desktopeditors"
        #     "com.github.unrud.djpdf"
        #     "com.github.unrud.RemoteTouchpad"
        #     "io.gitlab.news_flash.NewsFlash"
        #     "com.warlordsoftwares.tube2go"
        #     "com.warlordsoftwares.formatlab"
        #     "io.github.zaedus.spider"
        #     "eu.nokun.MirrorHall"
        #     "es.danirod.Cartero"
        #     "pl.youkai.nscan"
        #     "com.mardojai.ForgeSparks"
        #     "com.github.tchx84.Flatseal"
        #     "com.belmoussaoui.snowglobe"
        #     "com.jetpackduba.Gitnuro"
        #     "de.philippun1.turtle"
        #     "de.philippun1.Snoop"
        #     "io.gitlab.theevilskeleton.Upscaler"
        #     "io.gitlab.adhami3310.Converter"
        #     "io.gitlab.adhami3310.Footage"
        #     "com.github.ADBeveridge.Raider"
        #     "com.github.tenderowl.frog"
        #     "org.angryip.ipscan"
        #     "org.gabmus.whatip"
        #     "org.nmap.Zenmap"
        #     "io.github.bytezz.IPLookup"
        #     "dev.geopjr.Archives"
        #     "io.github.getnf.embellish"
        #     "com.github.cassidyjames.dippi"
        #     "it.mijorus.whisper"
        #     # "com.github.joseexposito.touche"
        #     "io.github.vikdevelop.SaveDesktop"
      ];
    };
    fwupd.enable = true;
    # Enable the KDE Plasma Desktop Environment.
    # displayManager = {
    #   sddm = {
    #     enable = true;
    #    wayland.enable = true;
    #  };
    # };
    # desktopManager.plasma6.enable = true;
    xserver = {
      # Enable the X11 windowing system.
      enable = true;
      # Configure keymap in X11
      xkb.layout = "us";
      # Load nvidia driver for Xorg and Wayland
      videoDrivers = [ "nvidia" ];
    };
    # Enable the GNOME Desktop Environment.
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    # Enable the OpenSSH daemon.
    openssh.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
    gnome = {
      sushi.enable = true;
      gnome-user-share.enable = true;
      gnome-keyring.enable = true;
      gnome-software.enable = true;
      gnome-online-accounts.enable = true;
    };
    samba = {
      enable = true;
      openFirewall = true;
      settings = {
        public = {
          browseable = "yes";
          comment = "Public samba share.";
          writable = "yes";
          "guest ok" = "yes";
        };
      };
    };
  };
}
