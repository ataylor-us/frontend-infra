default:
    ansible-galaxy install -r requirements.yml
    ansible-playbook master.yml
