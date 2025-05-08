#!/bin/bash

  api_url="https://api.github.com/repos/kb10uy/MomiageMono/releases/latest"
  response=$(curl -sL --retry 3 --retry-delay 5 "$api_url")
  # レスポンスが空の場合は他のアプローチから取得
  if [ -z "$response" ]; then
    echo "Error: Failed to fetch release information from GitHub API, trying wget fallback."
    response=$(wget -qO- "$api_url")
    if [ -z "$response" ]; then
      echo "Error: Failed to fetch release information from wget fallback."
      exit 1
    fi
  fi
  
  # タグ名からバージョン番号を取得。ハイフンが含まれるためraw値を使用。
  tag_name=$(echo "$response" | jq -r '.tag_name')
  version=$(echo "$tag_name" | sed 's/^v//')
  
  # アセットURLを取得。ただしバージョン番号にハイフンが含まれているため注意。
  asset_url=$(echo "$response" | jq -r '.assets[] | select(.name | contains("MomiageMono")) | .browser_download_url')
  
  # 取得できなかった場合のURL生成（fallback）
  if [ -z "$asset_url" ]; then
    echo "API didn't return asset URL. Using fallback URL."
    asset_url="https://github.com/kb10uy/MomiageMono/releases/download/${tag_name}/MomiageMono-${tag_name}.zip"
  fi
  
  # 出力
  echo "version=$version"
  echo "tag_name=$tag_name"
  echo "asset_url=$asset_url"