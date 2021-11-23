# manjaro-dotfiles
Follows the `--bare` git repository approach for tracking dotfiles. Credit: https://www.atlassian.com/git/tutorials/dotfiles

## Fresh machine setup
After your installation is complete lets get our dotfiles setup.

1. Setup `dotfiles` alias.
```bash
git init --bare $HOME/.cfg
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
dotfile config --local status.showUntrackedFiles no
dotfiles config --local status.showUntrackedFiles no
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

2. Pull down the repository
```
dotfiles remote add origin git@github.com:aclevername/manjaro-dotfiles.gi
dotfiles pull origin main
dotfiles branch -m master main
```

3. Run sync to update system and packages
```
./sync.bash
```

