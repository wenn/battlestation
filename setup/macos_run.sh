#! /usr/bin/env sh

while getopts 'rh' flag; do
  case "${flag}" in
    h)
      echo "$0 - setup a mac with software."
      echo " "
      echo "options:"
      echo "-h    the [h]elp"
      echo "-r    only installed [r]equired modules"
      exit 0
      ;;
    r)
      required_only="true"
      shift
      ;;
    *)
      break
      ;;
  esac
done

function ensure_brew {
  if brew --version > /dev/null 2>&1; then
    echo ">> brew already installed @ version $(brew --version)."
    return 0
  fi

  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

function ensure_git {
  if git --version > /dev/null 2>&1; then
    echo ">> git already installed @ version $(git --version) "
    return 0
  fi

  brew install git && brew link git
}

function ensure_python2 {
  local version="2"

  if brew list python@$version > /dev/null 2>&1; then
    echo ">> python@$version already installed."
    return 0
  fi

  brew install python@$version \
    && brew unlink python \
    && brew link --overwrite python@$version
}

function ensure_ansible {
  local ansible_version=2.5
  local python_version="2.7"
  local pip_bin="pip$python_version"

  if ansible --version > /dev/null 2>&1; then
    local current_version=$(ansible --version | head -n 1 | awk -F' ' '{print $2}')

    if [[ $current_version == $ansible_version ]]; then
      echo ">> ansible==$ansible_version already installed"
      return 0
    fi
  fi

  $pip_bin install ansible==$ansible_version
}

ensure_brew
ensure_git
ensure_python2
ensure_ansible

if [[ $required_only != "true" ]]; then
  battlestation_path=/tmp/
  function ensure_battlestation {
    local bsm=battlestation-master

    cd /tmp
    rm -rf /tmp/$bsm

    curl \
      -sSL https://github.com/wenn/battlestation/archive/master.zip \
      -o ${bsm}.zip \
      && unzip $bsm \
      && cd $bsm
  }

  function run_playbook {
    cd $battlestation_path
    ansible-playbook -i HOSTS setup.yml
  }

  ensure_battlestation
  run_playbook
fi
