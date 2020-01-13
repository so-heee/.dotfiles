# neovim

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
$ pyenv install 2.7.15
$ pyenv virtualenv 2.7.16 neovim2
$ pyenv activate neovim2
$ pip2 install neovim
$ pyenv which python
```
## python3環境
```
$ pyenv install 3.5.3
$ pyenv virtualenv 3.5.3 neovim3
$ pyenv activate neovim3
$ pip install neovim
$ pyenv which python
```