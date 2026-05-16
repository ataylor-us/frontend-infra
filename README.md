# Base Arch playbook

Base playbook to set up an Arch box

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
