These are notes to myself, they should eventually make it into the readme.

- Install alacritty:
```bash
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt update
sudo apt install alacritty
```
- Get jedi to work with nvim: The file `vim/init.vim` should be a softlink to `vim/vimrc`. Inside that file, you fine a line
```vimscript
let g:python3_host_prog = "$HOME/...."
```
That line should point to a python virtual env, which should also exist. Activate the virtual env and then install the following:
```bash
pip install pynvim jedi
```
After that the jedi-vim plugin can access python jedi.
- The package indentpython seems to not make it to the right place: If your python indentation doesn't work properly, you may need to move that package to the right location
```bash
cp -r vim/pack/ingo/opt/indentpython.vim/indent/python.vim vim/indent/
```
make sure the target folder exists.
