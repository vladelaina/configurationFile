# ==================================================
# 🔧 快捷命令定义
# ==================================================
alias sz='source ~/.zshrc'                      # 重新加载配置
alias zs='nvim ~/.zshrc'                        # 编辑配置文件

# ==================================================
# 📝 编辑器 & 项目快捷打开
# ==================================================
alias i='nvim'                                  # 启动 nvim 编辑器
alias nf='neofetch'                             # 显示系统信息
alias we='nvim /mnt/c/Users/vladelaina/.config/wezterm/wezterm.lua'  # 编辑 wezterm 配置
alias si='sudo nvim'                            # 以 root 权限打开 nvim
alias iM='nvim Makefile'                        # 快速打开 Makefile

# ==================================================
# 📁 文件 & 目录操作
# ==================================================
alias c='cd'                                    # 简化 cd 命令
alias cd..='cd ..'                              # 返回上一级目录
alias de='cd /mnt/c/Users/vladelaina/Desktop'   # 快速进入桌面目录
alias wo='cd /home/vladelaina/code/Catime/'     # 快速进入项目目录
alias pw='pwd'                                  # 显示当前目录路径
alias mk='mkdir'                                # 创建新目录
alias rmr='rm -r'                               # 递归删除目录
alias l='ls'                                     # 简化 ls 命令
alias la='ls -a'                                 # 显示包括隐藏文件的目录列表
alias t2='tree -L 2'                             # 展示 2 层目录结构
alias t3='tree -L 3'                             # 展示 3 层目录结构

# ==================================================
# ⚙️ 系统 & 终端工具
# ==================================================
alias ex='exit'                                  # 快速退出 shell
alias ba='bash'                                  # 启动 bash 终端
alias top='htop'                                 # 启动 htop 资源管理器
alias goo='curl -o /dev/null https://www.google.com -w "%{time_total} seconds\n" -s'  # 测试访问 Google 所需时间

# ==================================================
# 🪟 Windows 集成
# ==================================================
alias e='explorer.exe'                           # 打开 Windows 资源管理器
alias e. ='explorer.exe .'                       # 打开当前目录
alias e..='explorer.exe ..'                     # 打开上一级目录
alias not='notepad.exe'                          # 启动记事本
alias nzs='notepad.exe ~/.zshrc'                 # 用记事本编辑 .zshrc

# ==================================================
# 📦 pacman 包管理（Arch Linux）
# ==================================================
alias sp='sudo pacman'                           # pacman 简写
alias spy='sudo pacman -Syu'                     # 更新所有包
alias spyu='sudo pacman -Syu'                    # 同上（备用）
alias sps='sudo pacman -S'                       # 安装包
alias spr='sudo pacman -R'                       # 删除包

# ==================================================
# 🧬 Git 快捷命令
# ==================================================
alias ga='git add .'                             # 添加所有变更
alias p='git push'                               # 推送到远程仓库
alias pu='git pull'                              # 拉取远程仓库内容
alias pf='git push -f'                           # 强制推送
alias r='git log --oneline --all --decorate --reverse -n 12'  # 查看最近的 12 条提交日志
alias s='git status'                             # 查看 Git 状态
alias op='git commit -am optimization'           # 提交优化日志
alias te='git commit -am temporary'              # 提交临时日志
alias gckm='git checkout main'                   # 切换到主分支

# ==================================================
# 🛠️ Git 配置与自定义函数
# ==================================================

# 快速提交当前更改（已暂存的和修改的文件）
gc() {
    git commit -am "$*"
}

# 添加所有更改并提交
ac() {
    git add .
    git commit -am "$*"
}

# 快速提交优化信息并推送
opp() {
    git commit -am "optimization"
    git push
}

# 添加所有更改、提交并推送
ap() {
    git add .
    git commit -am "$*"
    git push
}

# 修改上一次提交信息
amend() {
    git commit --amend -m "$*"
}

# 切换分支或检出文件
gck() {
    git checkout "$*"
}

# 回退到上一个提交（硬重置）
rhh() {
    git reset --hard HEAD^
}

# 回退到指定的提交（硬重置）
rh() {
    git reset --hard "$1"
}

# 以指定层级显示当前目录树，默认 5 层
t() {
    depth=${1:-5}
    tree -L "$depth"
}


# ==================================================
# 🎨 WezTerm 配置函数
# ==================================================

# 随机选择一张背景图片并设置为当前背景
wii() {
  total_images=55
  random_num=$((RANDOM % total_images + 1))
  sed -i "s|local BACKGROUND_IMAGE = \".*\.jpg\"|local BACKGROUND_IMAGE = \"$random_num.jpg\"|g" /mnt/c/Users/vladelaina/.config/wezterm/wezterm.lua
  print "$random_num"
}

# 设置指定编号的背景图片
wi() {
    if [[ -z "$1" ]]; then
        cd /mnt/c/Users/vladelaina/.config/wezterm/images
        explorer.exe .
        cd -
    else
        sed -i "s|local BACKGROUND_IMAGE = \".*\.jpg\"|local BACKGROUND_IMAGE = \"$1.jpg\"|g" /mnt/c/Users/vladelaina/.config/wezterm/wezterm.lua
    fi
}

# 删除当前背景图片，并随机切换到另一张
wid() {
    config_path="/mnt/c/Users/vladelaina/.config/wezterm/wezterm.lua"
    images_dir="/mnt/c/Users/vladelaina/.config/wezterm/images"
    image_name=$(grep -oP 'local BACKGROUND_IMAGE = "\K.*(?=")' "$config_path")
    full_path="$images_dir/$image_name"
    if [[ -e "$full_path" ]]; then
        wii
        rm "$full_path"
    else
        wii
    fi
}

# ==================================================
# ⚙️ 系统设置
# ==================================================
eval "$(starship init zsh)"                      # 启动 starship 提示符

# 启用语法高亮插件
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# 启用命令自动建议插件
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# 命令历史设置
HISTFILE=~/.histfile                             # 命令历史文件
HISTSIZE=1000                                    # 命令历史记录数量
SAVEHIST=1000                                    # 保存的历史记录数量
setopt autocd extendedglob notify                # 启用自动进入目录、扩展模式和通知模式
unsetopt beep nomatch                            # 关闭蜂鸣和匹配失败提示
bindkey -v                                       # 启用 vi 模式

# 自动补全配置
zstyle :compinstall filename '/home/vladelaina/.zshrc'   # 自动补全配置文件路径
autoload -Uz compinit                            # 加载补全初始化函数
compinit                                         # 初始化补全


# ==================================================
# 🌐 网络代理设置（适用于终端 & Git）
# ==================================================

# 设置终端环境变量，使用本地 10808 端口作为代理
export HTTPS_PROXY="http://127.0.0.1:10808"
export HTTP_PROXY="http://127.0.0.1:10808"
export ALL_PROXY="socks5://127.0.0.1:10808"  # 所有协议走 SOCKS5 代理

# Git 全局代理配置，走 SOCKS5 协议
git config --global http.proxy "socks5://127.0.0.1:10808"
git config --global https.proxy "socks5://127.0.0.1:10808"

# ==================================================
# 🧪 Git 实验性特性配置（可能随版本变动）
# ==================================================

# 自动内存回收策略（"gradual" 表示逐步释放）
git config --global experimental.autoMemoryReclaim gradual

# 启用镜像式网络模式（可能提升某些操作性能）
git config --global experimental.networkingMode mirrored

# 启用 DNS 隧道功能（可能规避某些 DNS 屏蔽）
git config --global experimental.dnsTunneling true

# 启用 Git 内部防火墙机制（增强安全性）
git config --global experimental.firewall true

# 禁用 Git 的自动代理功能（防止和自定义代理冲突）
git config --global experimental.autoProxy false
