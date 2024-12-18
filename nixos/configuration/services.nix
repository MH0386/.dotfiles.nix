{ ... }:
{
  services = {
    vnstat.enable = true;
    avahi = {
      enable = true;
      publish.enable = true;
    };
    flatpak = {
      enable = true;
      uninstallUnmanaged = true;
      update.onActivation = true;
      packages = [
        "io.github._0xzer0x.qurancompanion"
        "io.github.ladaapp.lada"
        "io.github.giantpinkrobots.flatsweep"
        "io.github.lo2dev.Echo"
        "io.github.flattool.Warehouse"
        "app.fotema.Fotema"
        "io.github.giantpinkrobots.varia"
        "io.podman_desktop.PodmanDesktop"
        "com.github.marhkb.Pods"
        "io.github.sigmasd.stimulator"
        "im.fluffychat.Fluffychat"
        # "com.jeffser.Alpaca"
        "dev.skynomads.Seabird"
        "net.sapples.LiveCaptions"
        "org.nickvision.tubeconverter"
        "re.sonny.OhMySVG"
        "com.usebottles.bottles"
        "com.github.gijsgoudzwaard.image-optimizer"
        "fr.handbrake.ghb"
        "io.github.seadve.Kooha"
        "net.nokyan.Resources"
        "org.onlyoffice.desktopeditors"
        "com.github.unrud.djpdf"
        "com.github.unrud.RemoteTouchpad"
        "io.github.arunsivaramanneo.GPUViewer"
        "io.gitlab.news_flash.NewsFlash"
        "app.drey.Dialect"
        "com.warlordsoftwares.tube2go"
        "com.warlordsoftwares.formatlab"
        "io.github.zaedus.spider"
        "eu.nokun.MirrorHall"
        "es.danirod.Cartero"
        "pl.youkai.nscan"
        "com.mardojai.ForgeSparks"
        "com.gitbutler.gitbutler"
        "io.github.dvlv.boxbuddyrs"
        "com.github.tchx84.Flatseal"
        "com.quexten.Goldwarden"
        "com.belmoussaoui.snowglobe"
        "com.jetpackduba.Gitnuro"
        "de.philippun1.turtle"
        "de.philippun1.Snoop"
        "com.github.qarmin.szyszka"
        "com.github.qarmin.czkawka"
        "io.gitlab.theevilskeleton.Upscaler"
        "io.gitlab.adhami3310.Converter"
        "io.gitlab.adhami3310.Footage"
        "com.github.ADBeveridge.Raider"
        "com.github.tenderowl.frog"
        "org.angryip.ipscan"
        "org.gabmus.whatip"
        "org.nmap.Zenmap"
        "io.github.bytezz.IPLookup"
        "dev.geopjr.Archives"
        "io.bassi.Amberol"
        "io.github.getnf.embellish"
        "com.github.cassidyjames.dippi"
        "it.mijorus.whisper"
        "io.github.zen_browser.zen"
        # "com.github.joseexposito.touche"
        "it.mijorus.gearlever"
        "io.github.vikdevelop.SaveDesktop"
        "org.fedoraproject.MediaWriter"
        "io.github.realmazharhussain.GdmSettings"
        "com.mattjakeman.ExtensionManager"
        # "app.devsuite.Ptyxis"
        "com.raggesilver.BlackBox"
      ];
    };
    fwupd.enable = true;
    ollama = {
      enable = true;
      acceleration = "cuda";
    };
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
      # Enable the GNOME Desktop Environment.
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };
    gnome.sushi.enable = true;
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
  };
}
