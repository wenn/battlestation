# Battlestation
Setup a machine with [ansible][ansible].
Credit to [Josheph Kahn's blog][josephkahn].

## Macos
Setup a macos machine.

#### Setup
1. remote `bash <(curl -ssSL https://raw.githubusercontent.com/wenn/battlestation/master/setup/macos_run.sh)`
2. local `./setup/macos_run.sh`

#### Supports

| Module | Version | Can be disabled? |
| --- |---:|---:|
| homebrew | latest | no |
| python | 2.7 | no |
| ansible | 2.4.3.0 | no |
| git | latest | no |
| chrome | latest | yes |
| vim | latest | yes |
| tmux | latest | yes |
| iterm2 | latest | yes |


#### Disable an installation
`main.yml` ( _./roles/macos/tasks/main.yml_ ) instructs all installations, simply comment a task to disable the installation.



## Configure a module
Configuration is managed via a [dotfiles](#what-is-a-dotfiles) git repo.
Configuration files are required to live at the top level of the `dotfiles` project.
To enable configuration, allow [setup]( #setup ) to know the _https uri_ repo location of your `dotfiles`.

#### What is a dotfiles
A personal repo to store your "dot" configurations, like a `.vimrc` or `.bash_rc`.

#### Example

```
/dotfiles
   .gitconfig
   .bash_profile
   .bash_rc
   .vimrc
```

#### Supports

| Module | How is it managed? |
| --- | :--- |
| git | A global config will be sym linked to your `dotfiles`' _.gitconfig_ |

---

[brew]: https://brew.sh/
[josephkahn]: https://blog.josephkahn.io/articles/ansible/
[ansible]: https://www.ansible.com/

