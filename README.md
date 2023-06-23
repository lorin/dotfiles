# dotfiles

My dotfiles, based on [oh-your-dotfiles](https://github.com/DanielThomas/oh-your-dotfiles).

## Installation

### Clone the repos 

```
git clone https://github.com/DanielThomas/oh-your-dotfiles ~/.oh-your-dotfiles
git clone (this repo) ~/.dotfiles
```

Oh-your-dotfiles looks for dotfiles directories in `~/.*dotfiles*`


### Run the installer

```
ZDOTDIR=~/.oh-your-dotfiles zsh
dotfiles_install
```

### neovim

```
:PlugInstall
```


## Commands

`dotfiles_update` - reinstall, skipping existing

