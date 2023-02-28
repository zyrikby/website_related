# Installation


Configuring virtual environments:

```bash
pyenv virtualenv $PY3 jupyter
pyenv virtualenv $PY3 tools3
```


Configuring `jupyter` environment

```bash
pyenv activate jupyter
pip install --upgrade pip

pip install jupyterlab
pip install ipywidgets
jupyter nbextension enable --py widgetsnbextension

pyenv deactivate
```


Configuring `tools3` environment:

```bash
pyenv activate tools3
pip install --upgrade pip
pip install pipx
pipx ensurepath

# install tools with pipx

pyenv deactivate
```

Add the line to `.bashrc`
```bash
eval "$(register-python-argcomplete pipx)"
```

Setting preferences:
```bash
echo "Setting pyenv global..."
pyenv global $PY3 $PY2 jupyter ipython2 tools3

echo "Updateing ipython startup scripts to include virtual environment packages..."
ipython profile create
curl -L http://hbn.link/hb-ipython-startup-script > ~/.ipython/profile_default/startup/00-venv-sitepackages.py
```

Installing tools with pipx:

```bash
pipx install poetry
 # configuring poetry to create venv directories inside the project
poetry config virtualenvs.in-project true

# adding lookup of bash completion files in user's directory
mkdir -p ~/.bash_completion.d/
if ! [ -f ~/.bash_completion ]; then
    echo '' >> ~/.bash_completion
    echo 'for bcfile in ~/.bash_completion.d/* ; do' >> ~/.bash_completion
    echo '    [ -f "$bcfile" ] && . $bcfile' >> ~/.bash_completion
    echo 'done' >> ~/.bash_completion
    
    echo '' >> ~/.bashrc
    echo 'if [ -f ~/.bash_completion ]; then' >> ~/.bashrc
    echo '    source ~/.bash_completion' >> ~/.bashrc
    echo 'fi' >> ~/.bashrc
fi

if ! [ -f ~/.bash_completion.d/poetry.bash-completion ]; then
    poetry completions bash > ~/.bash_completion.d/poetry.bash-completion
fi


pipx install ansible --include-deps

```
