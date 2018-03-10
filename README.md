# Battlestation
Setup a machine with [ansible][ansible].
Credit to [Josheph Kahn's blog][josephkahn].

## Macos
Setup a macos machine.

#### Requirements
1. [homebrew][brew]

#### Setup
1. remote `bash <(curl -ssSL https://raw.githubusercontent.com/wenn/battlestation/master/scripts/macos_run.sh)`
2. local `./macos_run.sh`

#### Supports

| Installation | Version | Can be disabled? |
| --- |---:|---:|
| git | latest | no |
| python | 2.7 | no |
| ansible | 2.4.3.0 | no |
| chrome | latest | yes |
| vim | latest | yes |
| tmux | latest | yes |

---

[brew]: https://brew.sh/
[josephkahn]: https://blog.josephkahn.io/articles/ansible/
[ansible]: https://www.ansible.com/
