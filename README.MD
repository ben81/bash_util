
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

	syntax *insideGit*

2. gitRoot

	syntax *gitRoot*

3. cdGitRoot

	syntax *cdGitRoot*

4. pwdGit

	syntax *pwdGit*

5. repoGit

	syntax *repoGit*

6. lsIgnore

	syntax *lsIgnore*

7. findIgnore

	syntax *findIgnore*




