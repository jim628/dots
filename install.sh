#!/bin/bash
set -e  # stop on the first error

script_dir="$(cd "$(dirname "$0")" && pwd)"
target="$HOME/.config/nvim"
backup="$HOME/.config/nvim.bak.$(date +%Y%m%d-%H%M%S)"

if [ -d "$target" ]; then
  rm -rf "$backup"          # clear any old backup
  mv "$target" "$backup"
fi

cp -r "$script_dir/nvim" "$target"
