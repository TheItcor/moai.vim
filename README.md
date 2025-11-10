<img width="936" height="257" alt="изображение" src="https://github.com/user-attachments/assets/ad953a56-f9ae-4c35-b1ba-3a2a4ef372a0" />

---

MoaiVim is a minimalistic config for your Neovim. It's easy to customize and extend.

<img width="1215" height="1191" alt="изображение" src="https://github.com/user-attachments/assets/742825fc-81c0-4e83-8ab8-969e78f1fc71" />

---
# Requirements
* Git
* Neovim >= 0.11.0


# How to install it?

### 1. Install the Neovim


Ubuntu/Debian
```
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt update && sudo apt install neovim
```

Arch
```
sudo pacman -S neovim
```

OpenSUSE
```
sudo zypper install neovim
```

Gentoo
```
sudo emerge -a app-editors/neovim
```

### 2. Clone the repository

```
git clone https://github.com/TheItcor/moai.vim.git ~/.config/nvim
```

### 3. Download the VimPlug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### 4. Open Neovim & install plugins

```
nvim
```
In Neovim enter:
```
:PlugInstall
```

Once everything is ready, **restart**

---
