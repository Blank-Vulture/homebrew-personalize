# homebrew-personalize
homebrewに登録されていないフォントやソフトウェアをbrewでインストール/アップデート可能にするためのリポジトリです。

- 2024/08/31 : add momiage-mono
- 2025/05/09 : add drawpen

## インストール方法
```bash
git clone
cd homebrew-personalize
brew tap homebrew-personalize
```

## 仕組み
./Casks/配下にあるファイルをhomebrewのCasksに追加することで、homebrewでインストールできるようにしています。
バージョン更新への対応等の保守はgithub actionsで行っています。

## 使い方
```bash
brew tap homebrew-personalize
brew install --cask <cask_name>
```
