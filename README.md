[![Build Status](https://travis-ci.org/wenn/battlestation.svg?branch=master)](https://travis-ci.org/wenn/battlestation)

# Battlestation
Setting up a new machine? Let [ansible][ansible] do all the work.
Save hours of finding downloads, managing installations, setting up configurations and trying to remember where things should be.

With [ansible] we're able to set up a new machine automatically, it can take only minutes to get your machine ready. [Ansible][ansible] commands are repeatable in an idempotent manner, meaning, it can be ran again to correct issues without having to run previously successful commands.

Credit to [Josheph Kahn's blog][josephkahn].

## MacOS
Setup a macos machine.

#### Quick Setup
`sh <(curl -H 'Cache-Control: no-cache' -ssSL https://raw.githubusercontent.com/wenn/battlestation/master/setup/macos_run.sh)`

*Make sure there are no newlines in your copy, it will affect [ansible] prompts*.
Quick setup will install [battlestation] to */tmp*, and uses the default installations and configurations.

#### Custom Setup
Allows you to disable/enable certain modules before running the [ansible] playbook.

1. clone [battlestation]
2. [modify] your [battlestation]
3. install required `./setup/macos_run.sh -r`
4. run the playbook `ansible-playbook -i HOSTS setup.yml` from [battlestation]

#### Supports
|  Module            |                 Version      |  Required      |  Enabled      |
|  ---               |---:                          |---:            |---:           |
|  [homebrew]        |                 latest       |  yes           |  yes          |
|  [python]          |                 2.7          |  yes           |  yes          |
|  [pip]             |                 latest       |  yes           |  yes          |
|  [ansible]         |                 2.5          |  yes           |  yes          |
|  [git]             |                 latest       |  yes           |  yes          |
|  [chrome]          |                 latest       |  no            |  yes          |
|  [vim]             |                 latest       |  no            |  yes          |
|  [tmux]            |                 latest       |  no            |  yes          |
|  [iterm2]          |                 latest       |  no            |  yes          |
|  [shiftit]         |                 latest       |  no            |  yes          |
|  [dropbox]         |                 latest       |  no            |  yes          |
|  [firefox]         |                 latest       |  no            |  yes          |
|  [awscli]          |                 latest       |  no            |  yes          |
|  [virtualenv]      |                 latest       |  no            |  yes          |
|  [node]            |                 latest       |  no            |  yes          |
|  [npm]             |                 latest       |  no            |  yes          |

#### Enable/Disable a module
Modify _./roles/macos/tasks/main.yml_. Comment a task to disable the module.

## Configurable modules
Configuration is managed via a [dotfiles] git repo.
Configuration files are required to live at the top level of the `dotfiles` project.
To enable configuration, allow [setup] to know the repo's _https uri_ of the `dotfiles`.

#### What is a dotfiles?
A personal repo to store your "dot" configurations, like a `.vimrc` or `.bashrc`.

#### Example

```
/dotfiles
   .gitconfig
   .bash_profile
   .bashrc
   .vimrc
```

#### Supports

| Module      | How is it managed?                                                                                                               |
| ---         | :---                                                                                                                             |
| [git]       |  _~/.gitconfig_  will be linked from the `dotfiles`' _.gitconfig_                                                                |
| [vim]       |  _~/.vimrc_  will be linked from the `dotfiles`' _.vimrc_. Will install [vundle] managed vim plugins if it is used in _.vimrc_.  |
| [bash]      | Links _~/.bashrc_ and *~/.bash\_profile* from `dotfiles` repo.                                                                   |
| [ideavim]   |  _~/.ideavimrc_  will be linked from the `dotfiles`' _.ideavimrc_.                                                               |
| [screen]    |  _~/.screenrc_  will be linked from the `dotfiles`' _.screenrc_.                                                                 |
| [tmux]      |  _~/.tmux.conf_  will be linked from the `dotfiles`' _.tmux.conf_.                                                               |

## TODO

- docker
- add iterm2 conf
- intelliJ ?
- sublime text 2 ?
- visual studio ?
- separate remote install and local install scripts.
- postman
- gem
- sdkman
- vbox

---

[modify]: #enabledisable-a-module
[dotfiles]: #what-is-a-dotfiles
[setup]: #setup

[battlestation]: https://github.com/wenn/battlestation
[josephkahn]: https://blog.josephkahn.io/articles/ansible/
[ansible]: https://www.ansible.com/
[vundle]: https://github.com/VundleVim/Vundle.vim
[tmux]: https://github.com/tmux/tmux/wiki
[homebrew]: https://brew.sh/
[git]: https://git-scm.com/
[chrome]: https://www.google.com/chrome/
[python]: https://www.python.org/
[pip]: https://pypi.org/project/pip/
[vim]: https://www.vim.org/
[iterm2]: https://www.iterm2.com/
[bash]: https://linux.die.net/man/1/bash
[screen]: https://www.gnu.org/software/screen/
[ideavim]: https://plugins.jetbrains.com/plugin/164-ideavim
[shiftit]: https://github.com/fikovnik/ShiftIt
[chef]: https://www.chef.io/
[puppet]: https://puppet.com/
[firefox]: https://www.mozilla.org/en-US/firefox/new/
[dropbox]: https://www.dropbox.com/
[awscli]: https://aws.amazon.com/cli/
[virtualenv]: https://virtualenv.pypa.io/en/stable/
[npm]: https://www.npmjs.com/
[node]: https://nodejs.org/en/
