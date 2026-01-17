
# script Bash #####################

## install #####################

This folder contains scripts to install various tools.

### install/debian/installDocker.sh

Installs Docker on Debian for the current user.

### install/debian//installPandoc.sh

Installs Pandoc on Debian.

### install/debian//installVsCode.sh

Installs Visual Studio Code on Debian.

### install/debian//installTool.sh

Installs the following tools on Debian:
- libxml2-utils
- jq
- maven

### install/installPythonTool.sh

Installs Python tools:
- beauty
- shdoc

## `source.sh`

**Syntax:** `source source.sh`

This script sources the following scripts:

- pathUtil.sh
- gitUtil.sh
- completion.sh
- cdrom.sh
- docker.sh
- maven.sh
- npmUtil.sh
- prompt.sh
- java.sh

## pathUtil.sh
This script configue a path tool.
you need source this script in bash
Syntax: *source pathUtil.sh*

### path

Syntax: *path*

this function list a folder in PATH variable

### addPath

Syntax: *addPath \<folder\>* .

This function add a given \<folder\> into the PATH in first folder.

NB: completion is configured to add directory

### removePath

Syntax: *removePath \<folder\>* .

This function remove a given \<folder\> into the PATH.

NB: completion is configured to propose directory present into a PATH variable

### cleanPath

Syntax: *cleanPath* .

This function cleanning a a PATH variable.

   1. remove unexisting folder.
   2. remove duplicate foler.

## util/generateDoc.sh

This script generate a PDF from README.MD

## completion.sh

Configure completion
you need source this script in bash
Syntax: *source completion.sh*


- Completion for NPM
- Completion for pandoc


## git_util.sh

Script for git
you need source this script in bash
Syntax: *source gitUtil.sh*


### insideGit

Syntax: *insideGit*

return a return  code ( $? ) 0 if a current directory is a in git working tree , otherwise 1

### gitRoot

Syntax: *gitRoot*

Display a absolute path to a root of current git working tree

### cdGitRoot

Syntax: *cdGitRoot*

Change directory to a root of current git working tree

### pwdGit

Syntax: *pwdGit*

Display a relative path in git directory

### repoGit

Syntax: *repoGit*

Find a git repository in currren sub folder

### repoWorkTree

Syntax: *repoWorkTree*

Find a git working tree  in currrent sub folder

### lsIgnore

Syntax: *lsIgnore*

List a file in git ignore in current directory

### findIgnore

Syntax: *findIgnore*

List a file in git ignore in current directory and sub directory

### needCommit

Syntax: *needCommit*

Return a return  code ( $? ) 0 if a current directory is a in git working tree and have file to commit , otherwise 0

### initAliasCdGitRepo

Syntax: *initAliasCdGitRepo*

Find a git working tree  in currrent sub folder  and find a maven or node project.

Create an alias for each

 - git working tree  found
 - maven project into repository found
 - node project into repository found



## cdrom.sh

Script for cd rom 

you need source this script in bash
Syntax: *source cdrom.sh*'

### findCdrom

Syntax: *findCdrom*

Find a cdrom folder 

### cdfindCdrom

Syntax: *cdfindCdrom*

change directory to cdrom folder 

## docker.sh

Script for docker
you need source this script in bash
Syntax: *source docker.sh*'


### dockerMount
  
Syntax: *dockerMount*

Lst all docker mount 

### dockerPs

Syntax: *dockerPs*

List all docker process


## maven.sh

Script for maven
you need source this script in bash
Syntax: *source maven.sh*'



### mvnCleanPackage

Syntax: *mvnCleanPackage*

Execute command: mvn clean package

### mvnTree

Syntax: *mvnTree*

Execute command: mvn dependency:tree

### mvnCheckVersion

Syntax: *mvnCheckVersion*

Execute command: mvn versions:display-dependency-updates

### mvnUpdateVersion

Syntax: *mvnUpdateVersion*

Execute command: mvn versions:use-latest-versions
    
## prompt.sh

### listcolor
Syntax: *listcolor*

List bash color 

### make_prompt
Synatx: *make_prompt*

Fonction to eval a bash PS1 value 


## java.sh


### setJavaHome
Syntax: *setJavaHome*

set the JAVA_HOME variable and update PATH with $JAVA_HOME/bin

this function has completion with __setJavaHome

### unsetJavaHome
Syntax: *unsetJavaHome*

unset the JAVA_HOME variable and remove $JAVA_HOME/bin in PATH variable

### javaHome
Syntax: *javaHome*

display the JAVA_HOME variable



