
# script Bash #####################

---

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

---

## `source.sh`

**Syntax:** `source source.sh`

This script sources the following scripts:

- [pathUtil.sh](#pathUtil.sh)
- [gitUtil.sh](#gitUtil.sh)
- [completion.sh](#completion.sh)
- [cdrom.sh](#cdrom.sh)
- [docker.sh](#docker.sh)
- [maven.sh](#maven.sh)
- [npmUtil.sh](#npmUtil.sh)
- [prompt.sh](#prompt.sh)
- [java.sh](#java.sh)


## pathUtil.sh
This script configue a path tool.
you need source this script in bash
Syntax: *source pathUtil.sh*

### path

Syntax: *path*

Lists all folders in the `PATH` variable.

### addPath

Syntax: *addPath \<folder\>* .

Adds the specified `<folder>` to the beginning of the `PATH` variable.

*Note:* Completion is configured to suggest directories.

### removePath

Syntax: *removePath \<folder\>* .

Removes the specified `<folder>` from the `PATH` variable.

*Note:* Completion suggests directories currently in `PATH`.

### cleanPath

Syntax: *cleanPath* .

Cleans the `PATH` variable by:

   1. remove unexisting folder.
   2. remove duplicate foler.
   
---

## completion.sh

**Syntax:** `source completion.sh`

Configures completion for:
- NPM
- Pandoc

---

## git_util.sh

**Syntax:** `source gitUtil.sh`

Script for Git utilities.


### insideGit

**Syntax:** `insideGit`

Returns an exit code (`$?`) of `0` if the current directory is in a Git working tree; otherwise, returns `1`.


### gitRoot

**Syntax:** `gitRoot`
   
Displays the absolute path to the root of the current Git working tree.

### **`cdGitRoot`**

   **Syntax:** `cdGitRoot`
   
   Changes the directory to the root of the current Git working tree.

### **`pwdGit`**

   **Syntax:** `pwdGit`
   
   Displays the relative path within the Git directory.

### **`repoGit`**

   **Syntax:** `repoGit`
   
   Finds a Git repository in the current subfolders.

### **`repoWorkTree`**

   **Syntax:** `repoWorkTree`
   
   Finds a Git working tree in the current subfolders.

### **`lsIgnore`**

   **Syntax:** `lsIgnore`
   
   Lists files ignored by Git in the current directory.

### **`findIgnore`**

   **Syntax:** `findIgnore`
   
   Lists files ignored by Git in the current directory and its subdirectories.

### **`needCommit`**

   **Syntax:** `needCommit`
   
   Returns an exit code (`$?`) of `0` if the current directory is in a Git working tree and has files to commit; otherwise, returns `1`.

### **`initAliasCdGitRepo`**

    **Syntax:** `initAliasCdGitRepo`
    
    Finds Git working trees in the current subfolders and identifies Maven or Node projects.
    Creates an alias for each:
    - Git working tree found.
    - Maven project in the repository.
    - Node project in the repository.

---

## cdrom.sh

**Syntax:** `source cdrom.sh`

Script for CD-ROM utilities.

###  **`findCdrom`**

   **Syntax:** `findCdrom`
   
   Finds a CD-ROM folder.

###  **`cdfindCdrom`**

   **Syntax:** `cdfindCdrom`
   
   Changes the directory to the CD-ROM folder.

---

## docker.sh

**Syntax:** `source docker.sh`

Script for Docker utilities.

### dockerMount
  
Syntax: *dockerMount*

Lists all Docker mounts.

### dockerPs

Syntax: *dockerPs*

Lists all Docker processes.

###  dockerImage

Syntax: *dockerImage*

Lists all Docker images. The result is a table format.

###  dockerImageJs

Syntax: *dockerImageJs*

Lists all Docker images. The result is a json format.


---

## maven.sh

**Syntax:** `source maven.sh`

Script for Maven utilities.


### isMavenProject

Syntax: *isMavenProject*

Returns an exit code (`$?`) of `0` if the current directory contains a pom.xml; otherwise, returns `1`.

### mvnCleanPackage

Syntax: *mvnCleanPackage*

Executes the command: `mvn clean package`.

### mvnTree

Syntax: *mvnTree*

Executes the command: `mvn dependency:tree`.

### mvnCheckVersion

Syntax: *mvnCheckVersion*

Executes the command: `mvn versions:display-dependency-updates`.

### mvnUpdateVersion

Syntax: *mvnUpdateVersion*

Executes the command: `mvn versions:use-latest-versions`.

### mvnTransitionalDependencies

Syntax: *mvnTransitionalDependencies*

### mvnAddNewDep

Syntax: *mvnTransitionalDependencies*

### mvnTransitionalDependenciesUpdate

Syntax: *mvnTransitionalDependenciesUpdate*

### mvnArtefactVersion

Syntax: *mvnArtefactVersion*

### mvnFormat

Syntax: *mvnFormat*



---

## npmUtil.sh

**Syntax:** `source npmUtil.sh`

Script for npm utilities.

### isNpm

Syntax: *isNpm*
 
### specificNpmNameVersion

Syntax: *specificNpmNameVersion*
 
### npmNameVersion

Syntax: *npmNameVersion*

### format_json

Syntax: *format_json*

### _format_json_completion

Syntax: *_format_json_completion*

    
---
    
## prompt.sh

### listcolor
Syntax: *listcolor*

Lists available Bash colors.

### make_prompt
Synatx: *make_prompt*

Function to evaluate the `PS1` value in Bash.

---

## java.sh


### setJavaHome
Syntax: *setJavaHome*

Sets the `JAVA_HOME` variable and updates `PATH` with `$JAVA_HOME/bin`.
*Note:* Completion is configured with `__setJavaHome`.


### unsetJavaHome
Syntax: *unsetJavaHome*

Unsets the `JAVA_HOME` variable and removes `$JAVA_HOME/bin` from the `PATH`.

### javaHome
Syntax: *javaHome*

Displays the `JAVA_HOME` variable.

---

## util/generateDoc.sh

This script generate a PDF from README.MD
