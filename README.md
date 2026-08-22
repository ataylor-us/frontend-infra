# Frontend playbook

Templated from [arch-base-infra](https://github.com/ataylor-us/arch-base-infra).

This box has the majority of my self-hosted services, divided into roles.  I used podman quadlets to run the containers, and tailscale to share them to my devices.

Some of these services include:
+ [Immich](https://immich.app) - `photo_server`
+ [Paperless-ngx](https://docs.paperless-ngx.com) - `document_server`
+ [Actual Budget](https://actualbudget.org) - `budget_server`
+ [Miniflux](https://miniflux.app) - `feed_server`
+ [Karakeep](https://karakeep.app) - `bookmark_server`
+ [Forgejo](https://forgejo.org) - `version_control_server`
+ [Memos](https://usememos.com/) - `note_server`
+ [Open WebUI](https://openwebui.com) - `ai_server`

## Auth
[lldap](https://github.com/lldap/lldap) + [Authelia](https://www.authelia.com/) is used for 2FA/SSO when possible.

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

## Versions

[Renovate](https://github.com/renovatebot/renovate) is used to make PRs for containers, Ansible Galaxy collections, and AUR packages.  Other updates are handled manually by the package manager.

