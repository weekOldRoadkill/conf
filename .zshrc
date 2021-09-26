# History
HISTFILE=~/.histfile
HISTSIZE=0x8000
SAVEHIST=0x8000




# Prompt
PROMPT="
%(#.%F{1}.%F{3})%n%f %F{2}at%f %F{3}%M%f %F{2}in%f %F{6}%4~%f
%(?.%F{14}.%F{9})%(#.#.$)%f "




# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh




# Aliases
alias tree="tree -aC"
alias ls="ls --color=auto -a"
alias grep="grep --color=auto"
alias clipboard="xclip -selection clipboard"
alias nelua="nelua -r -M -s -t -V --cc=clang --ldflags=-fuse-ld=lld"




# Luarocks Function
luarocks() {
    sudo luarocks ${@}
}




# Luarocks All Function
luarocks-all() {
    luarocks ${@}
    luarocks --lua-version 5.2 ${@}
    luarocks --lua-version 5.1 ${@}
}




# Markdown Function
markdown() {
    echo "<!DOCTYPE html> <html lang = en> <head> <meta charset = utf8> <style>" > ~/Downloads/md.html &&
    curl -s https://raw.githubusercontent.com/sindresorhus/github-markdown-css/main/github-markdown.css >> ~/Downloads/md.html &&
    echo "</style> </head> <body> <article class = markdown-body style = \"padding: 50px; margin: auto; width: 800px;\">" >> ~/Downloads/md.html &&
    cmark-gfm -e footnotes -e table -e strikethrough -e autolink -e tagfilter -e tasklist --strikethrough-double-tilde ${@} >> ~/Downloads/md.html &&
    echo "</article> </body> </html>" >> ~/Downloads/md.html &&
    firefox ~/Downloads/md.html && sleep 0.5
    rm -fr ~/Downloads/md.html
}




# P Function
p() {
    if [ ${1} = "install" ]; then
        yay --devel -S ${@:2}
    elif [ ${1} = "update" ]; then
        yay --devel -Syuu
    elif [ ${1} = "remove" ]; then
        yay --devel -Rcns ${@:2}
    elif [ ${1} = "autoremove" ]; then
        yay --devel -Rcns $(yay -Qdtq)
    elif [ ${1} = "search" ]; then
        yay --devel -Ss ${@:2}
    elif [ ${1} = "local" ]; then
        yay --devel -Qs ${@:2}
    elif [ ${1} = "aur" ]; then
        yay -Qm
    elif [ ${1} = "direct" ]; then
        yay --devel ${@:2}
    fi
}




# Greeting Code
neofetch
sudo zsh -c "{ rate-mirrors --allow-root arch > ~/Downloads/\$\$ && mv -f ~/Downloads/\$\$ /etc/pacman.d/mirrorlist } &"
