#! /bin/bash

# note this is convenience wrapper that can be symlinked

#
# pyenv
#
if [ -e "$HOME/.pyenv" ]; then
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    eval "$(pyenv init -)"
    if [ -e "$HOME/.pyenv/plugins/pyenv-virtualenv" ]; then
        eval "$(pyenv virtualenv-init -)"
    fi
fi

# shamelessly stolen from https://stackoverflow.com/a/246128
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"


pushd $DIR > /dev/null
python $DIR/blinky.py $@
popd > /dev/null
