[![Build Status](https://travis-ci.org/wenn/battlestation.svg?branch=master)](https://travis-ci.org/wenn/battlestation)

# Battlestation
Setting up a new machine? Let [ansible][ansible] do all the work.
Save hours of finding downloads, managing installations, setting up configurations and trying to remember where things should be.

With [ansible] we're able to set up a new machine automatically, it can take only minutes to get your machine ready. [Ansible][ansible] commands are repeatable in an idempotent manner, meaning, it can be ran again to correct issues without having to run previously successful commands.

Credit to [Josheph Kahn's blog][josephkahn].

## MacOS
Setup a macos machine.

#### Quick Setup
Quick setup will install [battlestation] to */tmp*,
and uses the default installations and configurations.

```sh
sh <(curl -H 'Cache-Control: no-cache' -ssSL https://raw.githubusercontent.com/wenn/battlestation/master/setup/macos_run.sh)
```

#### Custom Setup
Allows you to disable/enable certain modules before running the [ansible] playbook.

1. Get [battlestation] without git.
```sh
BSM=battlestation-master && curl -sSL https://github.com/wenn/battlestation/archive/master.zip -o ${BSM}.zip && unzip $BSM && cd $BSM
```
2. [modify] your [battlestation]
3. Install required modules `./setup/macos_run.sh -r`
4. From [battlestation], run the playbook `ansible-playbook -i HOSTS setup.yml`


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
Modify the file [_customize.yml_]. Comment to disable install.

## Dotfiles
#### What is a dotfile?
A personal repo to store your "dot" configurations, like a `.vimrc` or `.bashrc`.
For inspiration, take a look at [mathias's collective dotfiles](https://github.com/mathiasbynens/dotfiles).

#### How to enable?
To use your personal _dotfiles_, allow [setup] to know your dotfiles repository's _https uri_ of the `dotfiles`. The [setup] will provide a prompt for you to enter the location of your _dotfiles_ directory.

#### Supports
You can view a list of supported dotfiles here [_./roles/macos/vars/main.yml_].
If a dotfile does not exists in your personal dotfiles dir, it will be a no-op.
Furthermore, you can comment on items in `managed_dotfiles` to ignore
the default behavior.


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
[_./roles/macos/tasks/main.yml_]: https://github.com/wenn/battlestation/tree/master/roles/macos/tasks/main.yml
[_customize.yml_]: https://github.com/wenn/battlestation/tree/master/customize.yml
