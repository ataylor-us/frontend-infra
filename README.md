# Frontend playbook

Templated from [arch-base-infra](https://github.com/ataylor-us/arch-base-infra).

This box has the majority of my self-hosted services, divided into roles.  I used podman quadlets to run the containers, and tailscale to share them to my devices.

Some of these services include:
+ [Immich](https://immich.app) - `photo_server`
+ [Paperless-ngx](https://docs.paperless-ngx.com) - `document_server`
+ [Actual Budget](https://actualbudget.org) - `budget_server`
+ [FreshRSS](https://freshrss.org) - `feed_server`
+ [Karakeep](https://karakeep.app) - `bookmark_server`
+ [Forgejo](https://forgejo.org) - `version_control_server`
+ [Home Assistant](https://www.home-assistant.io) - `home_automation_server`

## Running

## Running

```bash
ssh-copy-id `#ip`
ansible-playbook master.yml -e tailscale_authkey=`#key` -e ansible_host=`#ip`
```

## Installation

Used `archinstall`.  Select linux-lts kernel. Select Minimal packages & choose NetworkManager during installation. chroot in after installing and enable the sshd service.

Base packages:
```json
    "packages": [
        "intel-ucode",
        "linux-firmware",
        "neovim",
        "openssh",
        "python"
    ],
```

Firewall rules (& drift management) are handled externally by [OpenVox](https://voxpupuli.org/openvox/).

## Manual Steps

Because of recent supply chain attacks, I am taking the precaution to no longer use an AUR helper and am limiting my reliance on AUR packages.

The following are built manually with `makepkg -si`, with the updated PKGBUILD reviewed before each build:

+ [autofs](https://aur.archlinux.org/packages/autofs)
