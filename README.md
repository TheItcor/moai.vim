
<p align="center">
       <img width="936" height="257" alt="изображение" src="https://github.com/user-attachments/assets/ad953a56-f9ae-4c35-b1ba-3a2a4ef372a0" />
</p>

---

<h3 align="center">  
       <br>
       MoaiVim is a minimalistic config for your Neovim. It's easy to customize and extend. This configuration is suitable for both beginners and experienced Vim users.
       <br><br>
       <img width="1215" height="1191" alt="изображение" src="https://github.com/user-attachments/assets/742825fc-81c0-4e83-8ab8-969e78f1fc71" />
</h3>


<h1 align="center">    
              
![Version](https://img.shields.io/badge/version-1.0-blue)
       ![Linux](https://img.shields.io/badge/Linux-FCC624?logo=linux&logoColor=black)
       ![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white)
       ![C++](https://img.shields.io/badge/C++-00599C?logo=c%2B%2B&logoColor=white)
       ![Java](https://img.shields.io/badge/Java-ED8B00?logo=java&logoColor=white)
       ![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)
              
</h1>


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
<br>

### 2. Clone the repository

```
git clone https://github.com/TheItcor/MoaiVim.git ~/.config/nvim
```
<br>

### 3. Download the VimPlug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
<br>

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

<br>

# What's inside?
- Git system right in Vim
- Terminal right in vim `Alt + x`
- Compile + Run `F5`
- File Manager `Alt + e`
- LSR
- Others nice stuff

<br>

# License?

It's GNU Licensе: GPL-3.0.

<br>

# Afterword

Thank you for your interest in my project. I welcome any suggestions you may have.

















