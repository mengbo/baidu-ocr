# baidu-ocr

截图转文字小工具，核心是调用百度文字识别服务的 shell 脚本，目前只支持 macOS 系统。

使用前需要在 百度智能云 => 产品服务 => 人工智能 => 文字识别 中创建应用，并记住应用的 API Key 和 Secret Key，在执行 `install.sh` 安装脚本后，需要将其写入 `~/.baidu-ocr/config` 文件的相应变量中。

程序利用了 pngpaste、jq 和 opencc，在 `install.sh` 脚本中会自动安装，但需要保证系统已经安装了 homebrew。

程序安装后会在系统菜单栏显示脚本菜单，在点击执行脚本菜单中的 BaiduOCR 脚本后，系统会交互选择部分屏幕区域，截屏并存入剪贴板，然后程序会自动调用百度文字识别服务将图像中的文字识别出来，并且重新将文字内容存入剪贴板。对于繁体中文内容，本程序会自动转换为简体中文。


## TODO

在 Linux 系统下，可以通过如下命令来截屏并存入剪贴板：
```
import png:- | xclip -selection clipboard -t image/png
```

可以通过如下命令将剪贴板中的图像转换为 Base64 编码：
```
xclip -selection clipboard -target image/png -o | base64
```
利用以上命令，完全可以在 Linux 系统下实现这个小工具。
