alias i = nvim
alias goo = curl -o /dev/null https://www.google.com -w "%{time_total} seconds\n" -s
alias nu = nvim ~/.config/nushell/config.nu
alias sn = exec nu
alias we =  nvim /mnt/c/Users/vladelaina/.config/wezterm/wezterm.lua
alias des = cd /mnt/c/Users/vladelaina/Desktop
alias wo = cd /home/vladelaina
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


