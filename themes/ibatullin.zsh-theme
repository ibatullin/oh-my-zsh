# Based on
# Blinks theme (https://github.com/blinks)
# Bureau theme

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"


local current_dir='%B%F{white}%c%b%f'
local user_info="%n@%m"
local git_info='%F{green}$(git_prompt_info)%f'
path="%~"

local first_left="%K{black} $current_dir%K{black} $git_info"
local first_right="[$user_info:$path] [%*]"

get_space () {
  local STR=$1$2
  local zero='%([BSUbfksu]|([FBK]|){*})'
  local LENGTH=${#${(S%%)STR//$~zero/}}
  local SPACES=""
  (( LENGTH = ${COLUMNS} - $LENGTH - 1))

  for i in {0..$LENGTH}
    do
      SPACES="$SPACES "
    done

  echo $SPACES
}


firstline() {
  spaces=`get_space $first_left $first_right`
  print
  print -rP "%K{black}$first_left%K{black}$spaces$first_right${reset_color}"

}

setopt promptsubst
setopt promptpercent
PROMPT=' %B❯%b $()'
RPROMPT='!%{%B%F{cyan}%}%!%{%f%k%b%}'

autoload -U add-zsh-hook
add-zsh-hook precmd firstline
