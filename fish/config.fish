if status is-interactive
    # Commands to run in interactive sessions can go here
end

export LSCOLORS=gxfxcxdxbxegedabagacad

# color setting
set -gx TERM xterm-256color

# theme
set -g theme_hide_hostname no
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hostname always
# Please modify your path here
set -gx PATH /home/zzl/software/ghq $PATH
set -gx PATH /home/zzl/software/peco_linux_amd64/ $PATH
set -gx PATH /home/zzl/software/exa/bin/ $PATH
set -gx PATH /opt/nvim-linux64/bin $PATH
set -gx PATH /home/zzl/dev/micmac_linux/bin $PATH
# aliases
# alias ls     "ls -p --no-group"
alias la     "ls -A"
# alias sleep  "sudo systemctl suspend"
# alias make   "bear -- make -j64"
# alias obs    "flatpak run com.obsproject.Studio"
alias gl     "git log --graph --pretty=format:'%x09%C(auto) %h %Cgreen %ar %Creset%x09 %C(cyan ul)%an%Creset %x09%C(auto)%s %d'"
alias gss    "git status --short --branch"
alias gs     "git status"
alias cat    "batcat < "
alias ca     "conda activate "

# # additional alias for exa
if type -q exa
  alias l "exa --icons --long --no-user"
  alias la "ll -a"
  alias lt 'exa -aT --color=always --group-directories-first --icons' # tree listing
end

# combine cd and ls together
functions --copy cd standard_cd
function cd
  standard_cd $argv; and ll
end





set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/zzl/miniconda3/bin/conda
    eval /home/zzl/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/zzl/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/zzl/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/zzl/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

# # Please create your own conda env and actvate it here
conda activate dev310
