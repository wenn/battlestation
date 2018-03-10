#! /usr/bin/env bash

battlestation_path=/tmp/battlestation

function ensure_brew {
  if brew --version > /dev/null 2>&1; then
    echo ">> brew already installed @ version $(brew --version)."
  else
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

function ensure_git {
  if git --version > /dev/null 2>&1; then
    echo ">> git already installed @ version $(git --version) "
  else
    brew install git && brew link git
  fi
}

function ensure_battlestation {
  local battlestation_repo=https://github.com/wenn/battlestation.git
  rm -rf $battlestation_path
  git clone $battlestation_repo $battlestation_path
}

function ensure_python2 {
  local version="2"

  if brew list python@$version > /dev/null 2>&1; then
    echo ">> python@$version already installed."
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
    echo ">> ansible==$ansible_version already installed"
  else
    $pip_bin install ansible==$ansible_version
  fi
}

function run_playbook {
  cd $battlestation_path
  ansible-playbook -i HOSTS setup.yml
}

ensure_brew
ensure_git
ensure_battlestation
ensure_python2
ensure_ansible

run_playbook
