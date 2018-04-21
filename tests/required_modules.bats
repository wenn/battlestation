#! /usr/bin/env bats

@test "pip is installed" {
  pip -V
}

@test "python is installed" {
  python -V
}

@test "ansible is installed" {
  ansible --version
}

@test "homebrew is installed" {
  brew --version
}

@test "git is installed" {
  git --version
}


