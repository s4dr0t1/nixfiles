[![Warning](https://img.shields.io/badge/Warning-WIP-red?style=flat&logo=serverfault)](https://en.wikipedia.org/wiki/Work_in_Progress_(https://en.wikipedia.org/wiki/Work_in_process))
[![NixOS 22.05](https://img.shields.io/badge/NixOS-22.05-blue.svg?style=flat&logo=NixOS&logoColor=white)](https://nixos.org)
![Nix Flake Check](https://github.com/s4dr0t1/nixfiles/workflows/Nix%20Flake%20Check/badge.svg)

### Introduction


This repository contains configuration files for my Nix universe shenanigans.

> **Warning**
> This work is a heavy work-in-progress. You aren't expected to test this configuration out in production environments.

### What the heck is NixOS?

If you stumbled upon this repository by chance and are scrambling your head about what the hell this Nix thing is? Let me help. :D

- [Nix](https://nixos.wiki/wiki/Nix_package_manager): It's a packaging and build system, the configuration files of which, are written with the help of [Nix Expression Language](https://nixos.wiki/wiki/Overview_of_the_Nix_Language).
- [NixOS](https://nixos.wiki/wiki/Overview_of_the_NixOS_Linux_distribution): A GNU/ Linux distribution based on Nix.
- [Nix Expression Language](https://nixos.wiki/wiki/Overview_of_the_Nix_Language): A programming language designed per the functional programming paradigm. Used to write instructions for the Nix packaging system and isn't a general-purpose programming language.


### Documentation

Name | Description | Link | Documentation
-|-|-|-
tmux | tmux is a terminal multiplexer: it enables a number of terminals to be created, accessed, and controlled from a single screen. tmux may be detached from a screen and continue running in the background, then later reattached. | WIP | [Documentation](./doc/tmux.md)
neovim | hyperextensible Vim-based text editor | WIP | [Documentation](./doc/nvim.md)

### How to get started?

There are a lot of resources out there to get started with Nix, here are the ones which helped me get past the learning curve.

- [Will T](https://github.com/wiltaylor)'s excellent playlist on NixOS: [YouTube](https://youtube.com/playlist?list=PL-saUBvIJzOkjAw_vOac75v-x6EzNzZq-)
- [Matthias Benaets](https://github.com/MatthiasBenaets) configuration guide for NixOS: [YouTube](https://youtu.be/AGVXJ-TIv3Y)
- [Andrew Tropin](https://github.com/abcdw)'s playlist on NixOS (some NixOS knowledge is required): [YouTube](https://youtube.com/playlist?list=PLZmotIJq3yOKew30oT8aEbPUOEKBmNpY1)

Done with the aforementioned links already and craving for more? Check out [NixOS Wiki](https://nixos.wiki) and [Awesome Nix](https://github.com/nix-community/awesome-nix).
