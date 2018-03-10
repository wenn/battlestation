# Battlestation
Setup a machine with [ansible][ansible].
Credit to [Josheph Kahn's blog][josephkahn].

## Macos
Setup a macos machine.

#### Setup
1. remote `bash <(curl -ssSL https://raw.githubusercontent.com/wenn/battlestation/master/scripts/macos_run.sh)`
2. local `./setup/macos_run.sh`

#### Supports

| Installation | Version | Can be disabled? | Can be configured? |
| --- |---:|---:|---:|
| ~/world | n/a | no | todo |
| homebrew | latest | no | todo |
| python | 2.7 | no | todo |
| ansible | 2.4.3.0 | no | todo |
| git | latest | no | todo |
| chrome | latest | yes | todo |
| vim | latest | yes | todo |
| tmux | latest | yes | todo |


#### Disable an installation
`main.yml` ( _./roles/macos/tasks/main.yml_ ) instructs all installations, simply comment a task to disable the installation.

---

[brew]: https://brew.sh/
[josephkahn]: https://blog.josephkahn.io/articles/ansible/
[ansible]: https://www.ansible.com/
