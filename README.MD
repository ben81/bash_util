
# script Bash

## install/installDocker.sh

This script install docker in debian for current user

## install/installPandoc.sh

This script install pandoc 

## pathUtil.sh
This script configue a path tool.
you need source this script in bash
Syntax: *source pathUtil.sh*'

1. path

Syntax: *path*

this function list a folder in PATH variable

2. addPath

Syntax: *addPath \<folder\>*.

This function add a given \<folder\> into the PATH in first folder.
 
NB: completion is configured to add directory
 
3. removePath

Syntax: *removePath \<folder\>* .

This function remove a given \<folder\> into the PATH.

NB: completion is configured to propose directory present into a PATH variable

4. cleanPath

Syntax: *cleanPath*.

This function cleanning a a PATH variable.

   1. remove unexisting folder.
   2. remove duplicate foler.

## generateDoc.sh

This script generate a PDF from README.MD

## completion.sh

Configure completion
you need source this script in bash
Syntax: *source completion.sh*'


- Completion for NPM


## git_util.sh

Script for git
you need source this script in bash
Syntax: *source gitUtil.sh*'


1. insideGit

Syntax: *insideGit*

2. gitRoot

Syntax: *gitRoot*

3. cdGitRoot

Syntax: *cdGitRoot*

4. pwdGit

Syntax: *pwdGit*

5. repoGit

Ssyntax: *repoGit*

6. lsIgnore

Syntax: *lsIgnore*

7. findIgnore

Syntax: *findIgnore*

8. needCommit

Syntax: *needCommit*


