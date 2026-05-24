default:
    ansible-galaxy install -r requirements.yml
    ansible-playbook master.yml

check:
    ansible-galaxy install -r requirements.yml
    ansible-playbook --check --skip-tags tailscale master.yml
