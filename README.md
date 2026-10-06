# dotfiles_ansible

Ansible role that installs `git` and `stow` and clones the [dotfiles](https://github.com/Varssos/dotfiles) repository to `~/dotfiles` on Debian/Ubuntu systems.

Stowing of individual packages is done by the roles that depend on this one (`bashrc`, `kitty`, `tmux`).

## Requirements

- Debian or Ubuntu host
- `become: true` privileges (sudo)
- `ansible_user` must be set

## Role Variables

| Variable | Default | Description |
|---|---|---|
| `user_home_path` | `/home/{{ ansible_user }}` | Home directory of the target user |
| `dotfiles_path` | `{{ user_home_path }}/dotfiles` | Where the dotfiles repo is cloned |
| `dotfiles_repo` | `https://github.com/Varssos/dotfiles.git` | Dotfiles repository URL |

## Example Playbook

```yaml
- hosts: all
  become: true
  roles:
    - role: dotfiles
```
