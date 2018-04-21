#! /usr/bin/env bats

@test "chrome is installed" {
  test -d "/Applications/Google Chrome.app"
}

@test "vim is installed" {
  vim --version
}

@test "tmux is installed" {
  tmux -V
}

@test "iterm2 is installed" {
  test -d "/Applications/Iterm.app"
}

@test "shiftit is installed" {
  test -d "/Applications/ShiftIt.app"
}

@test "dropbox is installed" {
  test -d "/Applications/Dropbox.app"
}

@test "firefox is installed" {
  test -d "/Applications/Firefox.app"
}
