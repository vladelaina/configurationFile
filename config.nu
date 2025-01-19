alias i = nvim
alias goo = curl -o /dev/null https://www.google.com -w "%{time_total} seconds\n" -s
alias nu = nvim ~/.config/nushell/config.nu
alias sn = exec nu
alias we =  nvim /mnt/c/Users/vladelaina/.config/wezterm/wezterm.lua
alias des = cd /mnt/c/Users/vladelaina/Desktop
alias wo = cd /home/vladelaina/code/
alias top = htop
alias e = explorer.exe
alias no = notepad.exe
alias mk = mkdir
alias sp = sudo pacman
alias spy = sudo pacman -Syu
alias spyu = sudo pacman -Syu
alias sps = sudo pacman -S
alias spr = sudo pacman -R
alias si = sudo nvim
alias ga = git add .
alias gp = git push
alias gpf = git push -f
alias gr = git log --oneline --all --decorate --reverse -n 20
alias gs = git status
alias im = nvim main.c
alias imc = nvim main.cpp
alias iM = nvim Makefile
alias ma = make
alias ms = make stop
alias mr = make run
alias gcl = git clone
def wi [num?: string] {
    if ($num == null) {
        do {
            cd /mnt/c/Users/vladelaina/.config/wezterm/images
            ^explorer.exe .
            cd -
        }
    } else {
        ^sed -i $"s/local BACKGROUND_IMAGE = \".*\\.jpg\"/local BACKGROUND_IMAGE = \"($num).jpg\"/g" /mnt/c/Users/vladelaina/.config/wezterm/wezterm.lua
    }
}
def wii [] {
    let total_images = 170
    let random_num = (random int 1..$total_images | into string)

    ^sed -i $"s/local BACKGROUND_IMAGE = \".*\\.jpg\"/local BACKGROUND_IMAGE = \"($random_num).jpg\"/g" /mnt/c/Users/vladelaina/.config/wezterm/wezterm.lua
     print $"($random_num)"
}
def wid [] {
    let config_path = "/mnt/c/Users/vladelaina/.config/wezterm/wezterm.lua"
    let images_dir = "/mnt/c/Users/vladelaina/.config/wezterm/images"
    let image_name = (open $config_path | lines | filter { $in | str contains "BACKGROUND_IMAGE" } | first | str replace 'local BACKGROUND_IMAGE = "' '' | str replace '"' '')
    let full_path = $"($images_dir)/($image_name)"
    if ($full_path | path exists) {
        wii
        rm $full_path
    } else {
        wii
    }
}
def gc [...message: string] {
    git commit -am ($message | str join ' ')
}
def gac [...message: string] {
    git add .
    git commit -am ($message | str join ' ')
}
def gck [...message: string] {
  git checkout ($message | str join ' ')
}
alias gckm = git checkout main

def grh [...commit: string] {
    git reset --hard ($commit | str join ' ')
}
alias grhh = git reset --hard HEAD^
def t [depth: int = 2] {
    tree -L $depth
}
def co [file?: path] {
    if ($file == null) {
        /mnt/c/Users/vladelaina/AppData/Local/Programs/cursor/Cursor.exe --disable-extensions --new-window out+err> /dev/null
    } else {
        /mnt/c/Users/vladelaina/AppData/Local/Programs/cursor/Cursor.exe --disable-extensions --new-window $file out+err> /dev/null
    }
}
##########系统设置#########
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")


$env.config = {
    shell_integration: {
        osc133: false
    }
    show_banner: false
}


# 默认代理配置
$env.HTTPS_PROXY = "http://127.0.0.1:10808"
$env.HTTP_PROXY = "http://127.0.0.1:10808"
$env.ALL_PROXY = "socks5://127.0.0.1:10808"


# 设置 Git 全局代理配置
^git config --global http.proxy "socks5://127.0.0.1:10808"
^git config --global https.proxy "socks5://127.0.0.1:10808"
^git config --global experimental.autoMemoryReclaim gradual
^git config --global experimental.networkingMode mirrored
^git config --global experimental.dnsTunneling true
^git config --global experimental.firewall true
^git config --global experimental.autoProxy false
