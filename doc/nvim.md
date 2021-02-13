# neovim

neovimの使用するPythonの仮想環境を用意

## インストール可能なPythonのバージョンを確認

```
$ pyenv install --list
```

## インストール済みのPythonバージョンを確認

```
$ pyenv versions
```

## python2環境
```
pyenv install 2.7.15
pyenv virtualenv 2.7.16 neovim2
pyenv activate neovim2
pip install --upgrade pip
pip install neovim
pyenv which python
```

## python3環境
```
pyenv install 3.5.3
pyenv virtualenv 3.5.3 neovim3
pyenv activate neovim3
pip3 install --upgrade pip
pip3 install neovim
pyenv which python
```