# manjaro-dotfiles
Follows the `--bare` git repository approach for tracking dotfiles. Credit: https://www.atlassian.com/git/tutorials/dotfiles

## Fresh installation
After your installation is complete lets get our dotfiles setup.

1. Setup `dotfiles` alias.
```bash
git init --bare $HOME/.cfg
alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles config --local status.showUntrackedFiles no
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

2. Pull down the repository
```
dotfiles remote add origin git@github.com:aclevername/manjaro-dotfiles.git
dotfiles pull origin main
dotfiles branch -m master main
```

3. Run sync to update system and packages
```
./sync.bash install
```

## Existing installation
To keep an existing installation up-to-date run

```bash
# make sure you have a clean dotifles directory
dotfiles pull origin main
./sync.bash
```

## Manually installed
- autojump
