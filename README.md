# README

## Instructions bare repository

The technique consists in storing a Git bare repository in a "side" folder (like `$HOME/.cfg` or `$HOME/.dotfiles`) using a specially crafted alias so that commands are run against that repository and not the usual `.git` local folder, which would interfere with any other Git repositories around.

```bash
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

Make sure your repository ignores the folder where you'll clone it, so that you don't create weird recursion problemes:

```bash
echo ".dotfiles" >> .gitignore
```

After you've executed the setup any file within the `$HOME` folder can be versioned with normal commands, replacing git with your newly created config alias, like:

```bash
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"config push
```

### Install your dotfiles onto a new system


```bash
git clone --bare <git-repo-url> $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
```

You're done, from now on you can now type config commands to add and update your dotfiles.

```bash
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

[Link](https://www.atlassian.com/git/tutorials/dotfiles)

