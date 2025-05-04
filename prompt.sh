
#
#PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null); PS1_CMD2=$(cmd1)'; 
#PS1='\[\e[38;5;171m\]\u\[\e[0m\] @\[\e[40m\]\h\[\e[0m\]:\[\e[38;5;83m\]\w\[\e[0m\] \[\e[30;101m\]${PS1_CMD1}\[\e[91;106m\]\[\e[30m\]${PS1_CMD2}\[\e[96;40m\]\[\e[0m\]\\$ '

function __displayVersion() {
	echo "$(mvnArtefactVersion) $(npmNameVersion)"
}





PROMPT_COMMAND='PS1_CMD1=$(currentBranchGit)$(tracking_info)$(needCommit); PS1_CMD2=$(__displayVersion)';
#PS1='\[\e[38;5;171m\]\u@\h\[\e[0m\]:\[\e[38;5;83m\]\w\[\e[0m\] \[\e[91m\]${PS1_CMD1}\[\e[0m\] \\$ '
PS1='\[\e[38;5;171m\]\u@\h\[\e[0m\]:\[\e[38;5;83m\]\w\[\e[0m\] \[\e[30;101m\]${PS1_CMD1}\[\e[91;106m\]\[\e[30m\]${PS1_CMD2}\[\e[96;40m\]\[\e[0m\]\\$ ' 