
# script Bash #####################

## install #####################

this folder define a script for install tool.

### install/installDocker.sh

This script install docker in debian for current user

### install/installPandoc.sh

This script install pandoc 

## source.sh ###

Syntax: *source source.sh*
this script source a followd script:

- pathUtil.sh
- gitUtil.sh
- completion.sh

## pathUtil.sh
This script configue a path tool.
you need source this script in bash
Syntax: *source pathUtil.sh*

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
- Completion for pandoc


## git_util.sh

Script for git
you need source this script in bash
Syntax: *source gitUtil.sh*'


1. insideGit

Syntax: *insideGit*

return a return  code ( $? ) 0 if a current directory is a in git working tree , otherwise 0

2. gitRoot

Syntax: *gitRoot*

Display a absolute path to a root of current git working tree

3. cdGitRoot

Syntax: *cdGitRoot*

Change directory to a root of current git working tree

4. pwdGit

Syntax: *pwdGit*

Display a relative path in git directory

5. repoGit

Syntax: *repoGit*

Find a git repository in currren sub folder

6. repoWorkTree

Syntax: *repoWorkTree*

Find a git working tree  in currrent sub folder

7. lsIgnore

Syntax: *lsIgnore*

List a file in git ignore in current directory

8. findIgnore

Syntax: *findIgnore*

List a file in git ignore in current directory and sub directory

9. needCommit

Syntax: *needCommit*

return a return  code ( $? ) 0 if a current directory is a in git working tree and have file to commit , otherwise 0

10. initAliasCdGitRepo

Syntax: *initAliasCdGitRepo*

Find a git working tree  in currrent sub folder  and find a maven or node project.

Create an alias for each

 - git working tree  found
 - maven project into repository found
 - node project into repository found




