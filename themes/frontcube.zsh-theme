PROMPT='
%{$fg[cyan]%}%~%{$reset_color%} % %{$reset_color%}
%{$fg[green]%}➞ %{$reset_color%}'

# Git info now all in cyan (prefix, branch name, dirty/clean symbols)
RPROMPT='%{$fg[cyan]%}$(git_prompt_info)%{$reset_color%} $(ruby_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✖%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_RUBY_PROMPT_SUFFIX="]%{$reset_color%}"