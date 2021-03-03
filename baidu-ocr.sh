#!/bin/sh


PATH=/usr/local/bin:$PATH

screencapture -ic

# Config AK for API Key and SK for Secret Key
source ~/.baidu-ocr/config

AT_URL="https://aip.baidubce.com/oauth/2.0/token"
AT_PAR="grant_type=client_credentials&client_id=$AK&client_secret=$SK"
AT="$(curl -s "$AT_URL?$AT_PAR" | jq -r .access_token)"

# brew install pngpaste
DATA=$(pngpaste -b)

URL="https://aip.baidubce.com/rest/2.0/ocr/v1/general_basic?access_token=$AT"
curl -s "$URL" --data-urlencode "image=$DATA" \
	-H 'Content-Type:application/x-www-form-urlencoded' \
	| jq -r '.words_result[] | .words' | opencc -c t2s | LC_CTYPE=UTF-8 pbcopy

LC_CTYPE=UTF-8 pbpaste
