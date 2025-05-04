
#



PROMPT_COMMAND='PS1_CMD1=$(currentBranchGit)$(tracking_info)$(needCommit)';
#PS1='\[\e[38;5;171m\]\u@\h\[\e[0m\]:\[\e[38;5;83m\]\w\[\e[0m\] \[\e[91m\]${PS1_CMD1}\[\e[0m\] \\$ '
PS1='\[\e[38;5;171m\]\u@\h\[\e[0m\]:\[\e[38;5;83m\]\w\[\e[0m\] \[\e[30;101m\]${PS1_CMD1}\[\e[0;91m\]\[\e[0m\]\\$ '