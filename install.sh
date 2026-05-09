# ------------------------------------------------------
# Install wallpapers
# ------------------------------------------------------
clear
echo -e "${GREEN}"
cat <<"EOF"
__        __    _ _
\ \      / /_ _| | |_ __   __ _ _ __   ___ _ __
 \ \ /\ / / _` | | | '_ \ / _` | '_ \ / _ \ '__|
  \ V  V / (_| | | | |_) | (_| | |_) |  __/ |
   \_/\_/ \__,_|_|_| .__/ \__,_| .__/ \___|_|
                   |_|         |_|

EOF
echo -e "${NONE}"

# 非 Git 安装：下载 Gitee 壁纸
if [ ! -d .git ]; then
    echo ">>> 准备从 Gitee 仓库下载壁纸资源..."
    echo ""

    if gum confirm "下载并安装壁纸仓库？" ;then
        echo ">>> 下载中..."
        wget -q -P $HOME/Downloads/ https://gitee.com/silaszk/wallpaper/repository/archive/master.zip

        echo ">>> 解压中..."
        unzip -q -o $HOME/Downloads/wallpaper-master.zip -d $HOME/Downloads/

        echo ">>> 安装到 $HOME/wallpaper/"
        mkdir -p $HOME/wallpaper
        cp -rf $HOME/Downloads/wallpaper-master/* $HOME/wallpaper/

        echo -e "${GREEN}>>> 壁纸安装完成！${NONE}"
    elif [ $? -eq 130 ]; then
        exit 130
    else
        echo ">>> 已取消安装"
        exit
    fi

# Git 模式：更新
else
    echo ">>> 已通过 Git 下载壁纸"
    echo ">>> 可通过 git pull 更新"
    echo ""

    if gum confirm "拉取最新更新？" ;then
        git pull --quiet
        echo -e "${GREEN}>>> 壁纸更新完成！${NONE}"
    elif [ $? -eq 130 ]; then
        exit 130
    else
        echo ">>> 已取消更新"
        exit
    fi
fi

echo ""