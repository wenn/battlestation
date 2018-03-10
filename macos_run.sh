#! /usr/bin/env bash

world_path=$HOME/world

function ensure_the_world {
    mkdir -p $world_path
}

function ensure_dotfiles {
  local dotfiles_path=$world_path/dotfiles
  local dotfiles_repo=https://nnguyen920@bitbucket.org/nnguyen920/dotfiles.git

  if [ -d "$dotfiles_path" ]; then
    echo ">>> $dotfiles_path already downloaded."
  else
    brew install git && brew link git
    git clone $dotfiles_repo $dotfiles_path
  fi
}

function ensure_python2 {
  local version="2"

  if brew list python@$version > /dev/null 2>&1; then
    echo ">>> python@$version already installed."
  else
    brew install python@$version \
      && brew unlink python@$version \
      && brew link python@$version
  fi
}

function ensure_ansible {
  local ansible_version=2.4.3.0
  local python_version="2.7"
  local pip_bin="pip$python_version"

  if ansible --version > /dev/null 2>&1; then
    echo ">>> ansible==$ansible_version already installed"
  else
    $pip_bin install ansible==$ansible_version
  fi
}

ensure_the_world
ensure_dotfiles
ensure_python2
ensure_ansible

ansible-playbook -i HOSTS setup.yml
