#!/usr/bin/env bash

echo "Starting process..."

for dir in $(ls -d ./*/); do
	package=$(basename $dir)
	stow -v --target="$HOME" -R $package
done

echo "DONE!"
