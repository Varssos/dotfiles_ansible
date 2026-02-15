# dotfiles_ansible

This project automate dotifles on ubuntu based systems with ansible.
Public dotfiles are stored in `dotfiles` repo.

## Usage

1. Install ansible
```
sudo apt update && sudo apt install ansible-core -y
```

2. Set username in `./hosts`
```
ansible_user=sw
```

3. Run ansible playbook on localhost
```
ansible-playbook run.yml -K
```


## Tests
Run ansible for test docker images
```
cd test_docker
./run.sh
```
