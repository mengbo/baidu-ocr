#!/bin/sh

brew install pngpaste
brew install jq
brew install opencc

defaults write com.apple.scriptmenu.plist ShowLibraryScripts -bool FALSE
open '/System/Library/CoreServices/Script Menu.app/'

osacompile -l JavaScript -o ~/Library/Scripts/BaiduOCR.scpt BaiduOCR.applescript

mkdir -p ~/.baidu-ocr
echo "AK=  # API Key" >> ~/.baidu-ocr/config
echo "SK=  # Secret Key" >> ~/.baidu-ocr/config

cp baidu-ocr.sh ~/bin/baidu-ocr
chmod +x ~/bin/baidu-ocr
