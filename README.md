# Base Arch playbook

Base playbook to set up an Arch box

```
ansible-playbook master.yml -e tailscale_authkey=`#key`
```

## Installation

Use linux-lts kernel. Select Minimal packages & choose NetworkManager during installation. chroot in after installing and enable the sshd service.

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
