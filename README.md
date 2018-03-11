# Battlestation
Setting up a new machine? Let [ansible][ansible] do all the work.
Save hours of managing downloads, installations, configurations and trying to remember where things should be.

With [ansible] we're able to set up a new machine automatically, it can take only seconds to get your machine ready. [Ansible][ansible] commands are repeatable in an idempotent manner, meaning, it can be ran again to correct issues without having to run previously successful commands.

Credit to [Josheph Kahn's blog][josephkahn].

## Macos
Setup a macos machine.

#### Setup
`sh <(curl -H 'Cache-Control: no-cache' -ssSL https://raw.githubusercontent.com/wenn/battlestation/master/setup/macos_run.sh)`

#### Development
- Run the full setup `./setup/macos_run.sh`
- Run the playbook `ansible-playbook -i HOSTS setup.yml`

#### Supports

| Module | Version | Can be disabled? |
| --- |---:|---:|
| [homebrew] | latest | no |
| [python] | 2.7 | no |
| [ansible] | 2.4.3.0 | no |
| [git] | latest | no |
| [chrome] | latest | yes |
| [vim] | latest | yes |
| [tmux] | latest | yes |
| [iterm2] | latest | yes |
| [shiftit] | latest | yes |


#### Disable a module
`main.yml` ( _./roles/macos/tasks/main.yml_ ) instructs all modules, simply comment a task to disable the module.



## Configure a module
Configuration is managed via a [dotfiles] git repo.
Configuration files are required to live at the top level of the `dotfiles` project.
To enable configuration, allow [setup] to know the repo's _https uri_ of the `dotfiles`.

#### What is a dotfiles?
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
| [git] | A global _.gitconfig_  will be linked from the `dotfiles`' _.gitconfig_ |
| [vim] | A global _.vimrc_  will be linked from the `dotfiles`' _.vimrc_. Will install [vundle] managed vim plugins if it is used in _.vimrc_.|
| [bash] | Links _.bashrc_ and *.bash\_profile* from `dotfiles` repo.|
| [ideavim] | A global _.ideavimrc_  will be linked from the `dotfiles`' _.ideavimrc_.|
| [screen] | A global _.screenrc_  will be linked from the `dotfiles`' _.screenrc_.|


## TODO

- add docker
- add iterm conf
- add intelliJ
- add sublime text 2
- add visual studio

---

[dotfiles]: #what-is-a-dotfiles
[setup]: #setup

[josephkahn]: https://blog.josephkahn.io/articles/ansible/
[ansible]: https://www.ansible.com/
[vundle]: https://github.com/VundleVim/Vundle.vim
[tmux]: https://github.com/tmux/tmux/wiki
[homebrew]: https://brew.sh/
[git]: https://git-scm.com/
[chrome]: https://www.google.com/chrome/
[python]: https://www.python.org/
[vim]: https://www.vim.org/
[iterm2]: https://www.iterm2.com/
[bash]: https://linux.die.net/man/1/bash
[screen]: https://www.gnu.org/software/screen/
[ideavim]: https://plugins.jetbrains.com/plugin/164-ideavim
[shiftit]: https://github.com/fikovnik/ShiftIt
[chef]: https://www.chef.io/
[puppet]: https://puppet.com/
