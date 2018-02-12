__kube_ps1()
{
  CONTEXT=$(kubectl config view | grep current-context | awk '{ print $NF }' | awk -F '.' '{ print $1 }')
  if [ -n "$CONTEXT" ]; then
      echo -n "🏠  [${CONTEXT}]"
  fi
}



PROMPT=$'%{$fg_bold[blue]%} $(__kube_ps1) %{$reset_color%}  %{$fg_bold[green]%}%n@%m %{$fg[blue]%}%D{[%X]} %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%} $(git_prompt_info)\
%{$fg[blue]%}->%{$fg_bold[blue]%} %#%{$reset_color%} '

PS1="\`if [ \$? = 0 ]; then echo 😄; else echo 😡; fi\`  ${PS1} "


