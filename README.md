# dotfiles_ansible

This project automate dotifles on ubuntu based systems with ansible.
Public dotfiles are stored in `dotfiles` repo.

## Usage

1. Install ansible
```
sudo apt update && sudo apt install ansible-core -y
```

2. Set ansible_user in `./hosts`
```
ansible_user=sw
```

3. Run ansible playbook on localhost
```
ansible-playbook run.yml -K
```


## Tests
Run ansible on VM run by vagrant. Check `vagrant_for_ansible/README.md`
```
cd vagrant_for_ansible
./run.sh
```
