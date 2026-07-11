default: install
    ansible-playbook master.yml

install:
    ansible-galaxy install -r requirements.yml
    pre-commit install

check: install
    ansible-playbook --check --skip-tags tailscale master.yml
