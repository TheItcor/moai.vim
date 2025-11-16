
<h1 align="center">    
       <img width="936" height="257" alt="изображение" src="https://github.com/user-attachments/assets/ad953a56-f9ae-4c35-b1ba-3a2a4ef372a0" />
 
              
![Version](https://img.shields.io/badge/version-1.3-green)
![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)
              
</h1>


<h3 align="center">  
       <br>
       MoaiVim is a minimalistic config for your Neovim. It's easy to customize and extend. This configuration is suitable for both beginners and experienced Vim users. 
       <br><br>
       <img width="1215" height="1191" alt="изображение" src="https://github.com/user-attachments/assets/742825fc-81c0-4e83-8ab8-969e78f1fc71" />
</h3>

*C++*? *Rust*? Maybe *Python*? This config is good for programming in most languages. Syntax **highlighting**, **snippets**, **LSR**, and **Vim-motions** will take your fast coding to the next level.




# Requirements
* Git
* Neovim >= 0.11.0


# How to install it?

### 1. Install the Neovim


Ubuntu / Debian /Linux Mint / Pop!_OS / Zorin OS
```
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt update && sudo apt install neovim
```

Arch / Manjaro / EndeavourOS / CachyOS
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

Fedora
```
sudo dnf install neovim
```

<br>

### 2. Install the config


Last stable verison:

**curl:**
```
TAG=$(curl -s https://api.github.com/repos/TheItcor/MoaiVim/releases/latest | grep "tag_name" | cut -d : -f 2 | cut -d \" -f2) && curl -L https://github.com/TheItcor/MoaiVim/archive/refs/tags/$TAG.zip -o /tmp/moai.zip && unzip /tmp/moai.zip -d /tmp/moai && mkdir -p ~/.config/nvim && mv /tmp/moai/*/* ~/.config/nvim/ && rm -rf /tmp/moai /tmp/moai.zip
```

**wget:**
```
TAG=$(wget -q -O - https://api.github.com/repos/TheItcor/MoaiVim/releases/latest | grep "tag_name" | cut -d : -f 2 | cut -d \" -f2) && wget https://github.com/TheItcor/MoaiVim/archive/refs/tags/$TAG.zip -O /tmp/moai.zip && unzip /tmp/moai.zip -d /tmp/moai && mkdir -p ~/.config/nvim && mv /tmp/moai/*/* ~/.config/nvim/ && rm -rf /tmp/moai /tmp/moai.zip
```

<br>

Unstable / bleeding-edge version verison:
```
git clone https://github.com/TheItcor/MoaiVim.git ~/.config/nvim
```

<br>


### 3. Open Neovim & Enjoy

```
nvim
```
... And just wait for Vim-Plug, plugins, and lsp to download.



<br>


# What's inside?
- Git system right in Vim
- Terminal right in vim `Alt + x`
- Compile + Run `F5`
- File Manager `Alt + e`
- LSR
- Snippets
- Others nice stuff

<br>

# License?

It's GNU Licensе: GPL-3.0.

<br>

# Afterword

Thank you for your interest in my project. I welcome any suggestions you may have.

















