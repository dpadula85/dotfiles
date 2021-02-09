#
# Source Prezto.
#
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#
# User configuration
# Command history configuration
#
HISTSIZE=10000
SAVEHIST=10000

if [ -z "$HISTFILE" ]; then
    HISTFILE=$HOME/.zsh_history
fi

#
# Show history
#
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt clobber

#
# PATH
#
export PATH="$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:"
export PATH="$PATH:/snap/bin:"
export PATH="$PATH:$HOME/software/Javier_bin"
export JOYCE="$HOME/software/Joyce"

#
# Preferred editor for local and remote sessions
#
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
#
# Source aliases
#
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

#
# Enable zmv
#
autoload -U zmv

#
# Enable Directory Stack
#
DIRSTACKSIZE=10
setopt autopushd pushdminus pushdsilent pushdtohome

#
# cd deference symlinks
#
setopt CHASE_LINKS

#
# Zsh specific aliases
#
alias mmv="noglob zmv -W"
alias dh="dirs -v"
alias prezup="cd ~/.zprezto && git pull && git submodule update --init --recursive"
alias rmf="rm *(.)"
alias rmd="rm *(/)"
#alias scp="noglob scp"
# Disable globbing on the remote path.
alias scp='noglob scp_wrap'
function scp_wrap {
  local -a args
  local i
  for i in "$@"; do case $i in
    (*:*) args+=($i) ;;
    (*) args+=(${~i}) ;;
  esac; done
  command scp "${(@)args}"
}

#
# Zsh feature to associate extension to some program
#
alias -s txt="vi"
alias -s dat="vi"
alias -s out="vi"
alias -s com="vi"
alias -s md="vi"

#
# Enable real time syntax highlighting
#
if [[ -s "${ZDOTDIR:-$HOME}/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# added by Anaconda2 4.3.0 installer
# export PATH="$HOME/anaconda2/bin:$PATH"  # commented out by conda initialize
# export PATH="$HOME/anaconda3/bin:$PATH"
# export PYTHONPATH="$HOME/anaconda3/bin:$PATH"

#
# Gromacs
#
if [ -d "$HOME/software/gromacs" ]; then
  source $HOME/software/gromacs/bin/GMXRC.zsh
fi

#
# ORCA
#
if [ -d "$HOME/software/orca_4_0_1_linux_x86-64_openmpi202" ]; then
  export PATH="$PATH:$HOME/software/orca_4_0_1_linux_x86-64_openmpi202"
fi

#
# Amber
#
# export AMBERHOME=/home/$USER/software/amber14
# source $AMBERHOME/amber.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/dpadula/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/dpadula/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/dpadula/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/dpadula/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
conda activate working
export PATH="$HOME/anaconda3/envs/working/bin:$HOME/software/JACoPO:$HOME/software/VAISD:$HOME/software/espana:$PATH"
export PATH="$PATH:$HOME/software/Multiwfn_3.7_dev_bin_Linux/:"
export PYTHONPATH="$HOME/anaconda3/envs/working/bin:$HOME/software/JACoPO:$HOME/software/VAISD:$HOME/software/espana:$PYTHONPATH:"
# export PYTHONPATH="$HOME/anaconda3/envs/working/bin:$PYTHONPATH:$HOME/software/espana:"

export KMP_STACKSIZE=200M
ulimit -s unlimited
