import os

# bkp old dotfiles
old_dots = [
    "~/.config/fish/config.fish",
    "~/.config/fish/fish_variables",
    "~/.config/nvim/init.lua",
    "~/.config/nvim/lua",
    "~/.config/xfce4/desktop",
    "~/.config/xfce4/helpers.rc",
    "~/.config/xfce4/panel",
    "~/.config/xfce4/xfconf",
    "~/.config/xfce4/xfwm4",
    "~/.vimrc",
]

os.system("mkdir -p ~/dotfiles_old")

for dot in old_dots:
    os.system(f"mv {dot} ~/dotfiles_old")

new_dots = [
    "~/dotfiles/fish-shell/config.fish",
    "~/dotfiles/fish-shell/fish_variables",
    "~/dotfiles/nvim/init.lua",
    "~/dotfiles/nvim/lua/",
    "~/dotfiles/xfce4/desktop/",
    "~/dotfiles/xfce4/helpers.rc",
    "~/dotfiles/xfce4/panel/",
    "~/dotfiles/xfce4/xfconf/",
    "~/dotfiles/xfce4/xfwm4/",
    "~/dotfiles/vimrc",
]

# create symlink for dotfiles
dots = dict(zip(old_dots, new_dots))

for old_dot in dots:
    os.system(f"ln -s {dots[old_dot]} {old_dot}")
