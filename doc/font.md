# フォント

以下の記事を参考に自分でパッチをあてる（gitにあるのは一部アイコンが文字化けした）
https://qiita.com/Suzukaze31/items/ddcc6d9a0a9da19f6ee3

RictyDiminishedDiscordにNerdFontのパッチを当てる

## pythonのインストール

※fontforgeがhomebrewでインストールしたpythonがないと動かないため一時的にインストール

```
brew install python
```

## FontForgeをインストール

Brewfileでインストールされている

## Nerd Fonts Patcherをダウンロードする

```
git clone https://github.com/ryanoasis/nerd-fonts.git
```

## RictyDiminishedDiscordをダウンロードする

```
git clone https://github.com/edihbrandon/RictyDiminished.git
```

## パッチを当てる

```
fontforge -script ~/nerd-fonts/font-patcher ~/.fonts/Menlo-Regular.ttf -c
```
