# manjaro-dotfiles
Follows the `--bare` git repository approach for tracking dotfiles. Credit: https://www.atlassian.com/git/tutorials/dotfiles

## Fresh machine guid
After your installation is complete lets get our dotfiles setup.

1. Setup `dotfiles` alias.
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
dotfile config --local status.showUntrackedFiles no
dotfiles config --local status.showUntrackedFiles no
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

1. Pull down the repository
```
dotfiles remote add origin git@github.com:aclevername/manjaro-dotfiles.gi
dotfiles pull origin main
```

