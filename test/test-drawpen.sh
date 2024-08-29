#!/bin/bash

api_url="https://api.github.com/repos/kb10uy/MomiageMono/releases/latest"
response=$(curl -sL "$api_url")
tag_name=$(echo "$response" | jq -r .tag_name)
version=${tag_name#v}
asset_url=$(echo "$response" | jq -r --arg version "$version" '.assets[] | select(.name | test("MomiageMono-" + $version + "\\.zip")) | .browser_download_url')

echo "version=$version"
if [ -z "$asset_url" ]; then
  echo "指定されたバージョンのアセットが見つかりませんでした。"
  exit 1
fi
echo "asset_url=$asset_url"

# asset_url存在確認。githubは302リダイレクトするので、-Lオプションをつける
curl -s -o /dev/null -w "%{http_code}" -L "$asset_url" | grep -q 200
if [ $? -ne 0 ]; then
  echo "アセットのURLが無効です。dmgファイルリリース時の命名規則が変更された可能性があります。"
  exit 1
fi
echo "アセットのURLは有効です。dmgファイルリリース時の命名規則は変更されていません。"
