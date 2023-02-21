<table align="center"><tr><td>
  <h2 align="center">⚠️&ensp;WARNING&ensp;⚠️</h2>
  <h5 align="center">This project is no longer maintained!</h3>
  <h3 align="center">Switch to <a href="https://github.com/hwittenborn/celeste">Celeste</a></h3>
  <p>I have decided to end the project for the time being to work on other projects, because other faster evolving project, <a href="https://github.com/hwittenborn/celeste">Celeste</a>, doing pretty much the same was released.</p>
</td></tr></table>

# Synchrony

**Sync your clouds**

<!--
<p>
  <a href="https://flathub.org/apps/details/app.drey.Pigeon">
    <img src="https://flathub.org/assets/badges/flathub-badge-en.svg" alt="Download on Flathub" width="200" />
  </a>
</p>
-->

[![Please do not theme this app](https://stopthemingmy.app/badge.svg)](https://stopthemingmy.app)
[![Liberapay](https://img.shields.io/badge/Liberapay-Donate-F6C915?logo=liberapay)](https://liberapay.com/pervoj)
[![Ko-fi](https://img.shields.io/badge/Ko--fi-Donate-FF5E5B?logo=kofi)](https://ko-fi.com/pervoj)
[![PayPal](https://img.shields.io/badge/PayPal-Donate-00457C?logo=paypal)](https://paypal.me/pervoj)

---

**Synchrony** is a new way to synchronize clouds in GNOME.
It is based on [rclone](https://rclone.org/) to provide the ability
to synchronize as much cloud providers as possible.

## ⚙️ Installing

### Stable, beta and development

Since this app is still under development, there are no official builds.

<!--
Stable releases:

```sh
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub app.drey.Pigeon
```

Beta releases:

```sh
flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo
flatpak install flathub-beta app.drey.Pigeon
```

Development releases:

```sh
flatpak remote-add --if-not-exists gnome-nightly https://nightly.gnome.org/gnome-nightly.flatpakrepo
flatpak install gnome-nightly app.drey.Pigeon.Devel
```
-->
### Building from source

There are two options how to do it:

- Run the app from [GNOME Builder](https://flathub.org/apps/details/org.gnome.Builder)
- Use the following commands to build it with Meson:

```sh
meson _build
sudo meson install -C _build
```

## 👥 Contributing

I'm happy to see you in this chapter! If you are interested in this project,
I would be glad for any help with development, design and translations.

For more info about contributing please read [this guide](CONTRIBUTING.md).
