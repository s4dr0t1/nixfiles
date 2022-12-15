# [s4dr0t1/nixfiles](github.com/s4dr0t1/nixfiles)

[<img src="https://nixos.org/logo/nixos-logo-only-hires.png" width="200" align="right" alt="NixOS">](https://nixos.org)
[![NixOS 23.05](https://img.shields.io/badge/NixOS-23.05-blue.svg?style=flat&logo=NixOS&logoColor=white)](https://nixos.org)
[![Nix Flake Check](https://github.com/s4dr0t1/nixfiles/workflows/Nix%20Flake%20Check/badge.svg)](https://github.com/s4dr0t1/nixfiles/actions)
[![Commit activity](https://img.shields.io/github/last-commit/s4dr0t1/nixfiles/main?style=flat)](https://github.com/s4dr0t1/nixfiles)
[![Warning](https://img.shields.io/badge/Warning-WIP-red?style=flat&logo=serverfault)](https://en.wikipedia.org/wiki/Work_in_Progress_(https://en.wikipedia.org/wiki/Work_in_process))

- [Introduction](#introduction)
- [What am I looking at?](#what-am-i-looking-at%3F)
- [Documentation](#documentation)
	- [Directory structure](#directory-structure)
	- [Keybindings](#keybindings)
	- [Wallpapers](#wallpapers)
- [How to get started?](#how-to-get-started%3F)
- [License](#license)

> **Warning**
> This project is a work-in-progress and production usage isn't recommended yet. For the time being, take inspiration from it to build something of your own.

## Introduction

This repository contains configuration files for my Nix universe shenanigans.

Component | Name
-|-
OS | [NixOS](https://nixos.org/)
WM | [Hyprland](https://hyprland.org/)
Terminal emulator | [Kitty](https://github.com/kovidgoyal/kitty)
Shell | [Fish](https://github.com/fish-shell/fish-shell)
Terminal multiplexer | [tmux](https://github.com/tmux/tmux)
Editor | [Neovim](https://github.com/neovim/neovim)
Launcher | [rofi-wayland](https://github.com/lbonn/rofi)

## What am I looking at?

If you stumbled upon this repository by chance and are scrambling your head about what the hell this Nix thing is? Let me help. :D

- [Dotfiles](https://github.com/xero/dotfiles#dotfiles): In the Unix universe, programs are commonly configured in two different ways, via shell arguments or text based configuration files. Programs with many options like Window Managers or text editors are configured on a per-user basis with files in your home directory ~. In Unix like OS any file or directory name that starts with a period is considered hidden, and in a default view will not be displayed. Thus the name dotfiles.
- [Nix](https://nixos.wiki/wiki/Nix_package_manager): It's a packaging and build system, the configuration files of which, are written with the help of [Nix Expression Language](https://nixos.wiki/wiki/Overview_of_the_Nix_Language).
- [NixOS](https://nixos.wiki/wiki/Overview_of_the_NixOS_Linux_distribution): A GNU/ Linux distribution based on Nix.
- [Nix Expression Language](https://nixos.wiki/wiki/Overview_of_the_Nix_Language): A programming language designed per the functional programming paradigm. Used to write instructions for the Nix packaging system and isn't a general-purpose programming language.

## Documentation

### Directory structure

```
.
├── doc/
├── flake.lock
├── flake.nix
├── hosts/
├── LICENSE.md
├── modules/
└── README.md
```

- `doc/` contains the documentation, cheatsheets and the likes.
- `hosts/` contains system level configuration for different hosts that I have.
- `modules/` contains application-level configuration, managed by home-manager and in some cases Nix, documentation can be found [here](./doc/README.md).

### Keybindings

Documentation can be found [here](./doc/README.md).

### Wallpapers

Support for static wallpaper is done through  `swaybg`. To make use of the feature, put the wallpaper you want to set as following: `~/Pictures/wallpaper`.

## How to get started?

There are a lot of resources out there to get started with Nix, here are the ones which helped me get past the learning curve.

- [Will T](https://github.com/wiltaylor)'s excellent playlist on NixOS: [YouTube](https://youtube.com/playlist?list=PL-saUBvIJzOkjAw_vOac75v-x6EzNzZq-)
- [Matthias Benaets](https://github.com/MatthiasBenaets) configuration guide for NixOS: [YouTube](https://youtu.be/AGVXJ-TIv3Y)
- [Andrew Tropin](https://github.com/abcdw)'s playlist on NixOS (some NixOS knowledge is required): [YouTube](https://youtube.com/playlist?list=PLZmotIJq3yOKew30oT8aEbPUOEKBmNpY1)

Done with the aforementioned links already and craving for more? Check out [NixOS Wiki](https://nixos.wiki) and [Awesome Nix](https://github.com/nix-community/awesome-nix).

## License

[<img src="https://gist.githubusercontent.com/xero/cbcd5c38b695004c848b73e5c1c0c779/raw/6b32899b0af238b17383d7a878a69a076139e72d/kopimi-sm.png" align="right" alt="komini" width="70">](https://kopimi.com)

All files and scripts in this repository are released [CC0](https://creativecommons.org/publicdomain/zero/1.0/)/ [kopimi](https://kopimi.com)! In the spirit of freedom of information, I encourage you to fork, modify, change, share, or do whatever you like with this project! `^c^v`
