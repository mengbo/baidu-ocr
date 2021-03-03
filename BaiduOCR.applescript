var app = Application.currentApplication()
app.includeStandardAdditions = true

let baiduOCRMessage = app.doShellScript('~/bin/baidu-ocr').substr(0,27) + ' ...'

let dialogText = '如下文字已经识别，并存入剪贴板：\n\n' + baiduOCRMessage

app.displayDialog(dialogText, {
    withTitle: "BaiduOCR",
    buttons: ["Continue"],
    defaultButton: "Continue"
})
