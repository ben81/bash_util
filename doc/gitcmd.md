
# git`-`add

- Add file contents to the index


`--`sparse

`--`no`-`all, `--`ignore`-`removal

`--`refresh

`--`ignore`-`errors

`--`ignore`-`missing

`--`no`-`warn`-`embedded`-`repo

`--`renormalize

`--`chmod=\(+`|``-`)x

`--`pathspec`-`from`-`file=`<file>`

`--`pathspec`-`file`-`nul

`--`

# git`-`am

- Apply a series of patches from a mailbox


`--`keep`-`non`-`patch

`--`[no`-`]keep`-`cr

`--`no`-`scissors

`--`quoted`-`cr=`<action>`

`--`empty=\(stop`|`drop`|`keep)

`--`no`-`message`-`id

`--`no`-`utf8

`--`rerere`-`autoupdate, `--`no`-`rerere`-`autoupdate

`--`ignore`-`space`-`change, `--`ignore`-`whitespace, `--`whitespace=`<option>`, `-`C`<n>`, `-`p`<n>`, `--`directory=`<dir>`, `--`exclude=`<path>`, `--`include=`<path>`, `--`reject

`--`patch`-`format

`--`committer`-`date`-`is`-`author`-`date

`--`ignore`-`date

`--`skip

`--`continue, `-`r, `--`resolved

`--`resolvemsg=`<msg>`

`--`abort

`--`quit

`--`show`-`current`-`patch[=\(diff`|`raw)]

`--`allow`-`empty

# git`-`apply

- Apply a patch to files and/or to the index


`--`stat

`--`numstat

`--`summary

`--`check

`--`index

`--`cached

`--`intent`-`to`-`add

`--`build`-`fake`-`ancestor=`<file>`

`--`reject

`--`unidiff`-`zero

`--`apply

`--`no`-`add

`--`allow`-`binary`-`replacement, `--`binary

`--`exclude=`<path`-`pattern>`

`--`include=`<path`-`pattern>`

`--`ignore`-`space`-`change, `--`ignore`-`whitespace

`--`whitespace=`<action>`

`--`inaccurate`-`eof

`--`recount

`--`directory=`<root>`

`--`unsafe`-`paths

`--`allow`-`empty

# git`-`archive

- Create an archive of files from a named tree


`--`format=`<fmt>`

`--`prefix=`<prefix>`/

`--`add`-`file=`<file>`

`--`add`-`virtual`-`file=`<path>`:`<content>`

`--`worktree`-`attributes

`--`remote=`<repo>`

`--`exec=`<git`-`upload`-`archive>`

# git`-`bisect

- Use binary search to find the commit that introduced a bug


`--`no`-`checkout

`--`first`-`parent

# git`-`blame

- Show what revision and author last modified each line of a file


`--`root

`--`show`-`stats

`--`reverse `<rev>`..`<rev>`

`--`first`-`parent

`--`line`-`porcelain

`--`incremental

`--`encoding=`<encoding>`

`--`contents `<file>`

`--`date `<format>`

`--`[no`-`]progress

`--`ignore`-`rev `<rev>`

`--`ignore`-`revs`-`file `<file>`

`--`color`-`lines

`--`color`-`by`-`age

`--`score`-`debug

`--`abbrev=`<n>`

`--`line`-`porcelain option can be used to output full commit information for each line, allowing simpler \(but less efficient) usage like:

# git`-`branch

- List, create, or delete branches


`--`no`-`contains inverts it. With `--`merged, only branches merged into the named commit \(i.e. the branches whose tip commits are reachable from the named

`--`set`-`upstream`-`to.

`--`create`-`reflog

`--`color[=`<when>`]

`--`no`-`color

`--`column[=`<options>`], `--`no`-`column

`--`show`-`current

`--`abbrev=`<n>`

`--`no`-`abbrev

`--`no`-`track

`--`recurse`-`submodules

`--`set`-`upstream

`--`unset`-`upstream

`--`edit`-`description

`--`contains [`<commit>`]

`--`no`-`contains [`<commit>`]

`--`merged [`<commit>`]

`--`no`-`merged [`<commit>`]

`--`sort=`<key>`

`--`points`-`at `<object>`

`--`format `<format>`

`--`no`-`contains commits are shown.

`--`no`-`merged commits are shown.

# git`-`bundle

- Move objects and refs by archive


`--`progress

`--`all`-`progress

`--`all`-`progress`-`implied

`--`version=`<version>`

# git`-`checkout

- Switch branches or restore working tree files


`--`progress, `--`no`-`progress

`--`ours, `--`theirs

`--`no`-`track

`--`guess, `--`no`-`guess

`--`orphan `<new`-`branch>`

`--`ignore`-`skip`-`worktree`-`bits

`--`conflict=`<style>`

`--`ignore`-`other`-`worktrees

`--`overwrite`-`ignore, `--`no`-`overwrite`-`ignore

`--`recurse`-`submodules, `--`no`-`recurse`-`submodules

`--`overlay, `--`no`-`overlay

`--`pathspec`-`from`-`file=`<file>`

`--`pathspec`-`file`-`nul

`--`

# git`-`cherry

- Find commits yet to be applied to upstream


# git`-`cherry`-`pick

- Apply the changes introduced by some existing commits


`--`cleanup=`<mode>`

`--`ff

`--`allow`-`empty

`--`allow`-`empty`-`message

`--`keep`-`redundant`-`commits

`--`strategy=`<strategy>`

`--`rerere`-`autoupdate, `--`no`-`rerere`-`autoupdate

`--`continue

`--`skip

`--`quit

`--`abort

# git`-`clean

- Remove untracked files from the working tree


# git`-`clone

- Clone a repository into a new directory


`--`remotes), and creates and checks out an initial branch that is forked from the cloned repository’s currently active branch.

`--`no`-`hardlinks

`--`reference[`-`if`-`able] `<repository>`

`--`dissociate

`--`progress

`--`server`-`option=`<option>`

`--`[no`-`]reject`-`shallow

`--`bare

`--`sparse

`--`filter=`<filter`-`spec>`

`--`also`-`filter`-`submodules

`--`mirror

`--`template=`<template`-`directory>`

`--`depth `<depth>`

`--`shallow`-`since=`<date>`

`--`shallow`-`exclude=`<revision>`

`--`[no`-`]single`-`branch

`--`no`-`tags

`--`recurse`-`submodules[=`<pathspec>`]

`--`[no`-`]shallow`-`submodules

`--`[no`-`]remote`-`submodules

`--`separate`-`git`-`dir=`<git`-`dir>`

`--`bundle`-`uri=`<uri>`

# git`-`commit

- Record changes to the repository


`--`fixup=[\(amend`|`reword):]`<commit>`

`--`squash=`<commit>`

`--`reset`-`author

`--`short

`--`branch

`--`porcelain

`--`long

`--`author=`<author>`

`--`date=`<date>`

`--`trailer `<token>`[\(=`|`:)`<value>`]

`--`allow`-`empty

`--`allow`-`empty`-`message

`--`cleanup=`<mode>`

`--`no`-`edit

`--`amend

`--`no`-`post`-`rewrite

`--`pathspec`-`from`-`file=`<file>`

`--`pathspec`-`file`-`nul

`--`dry`-`run

`--`status

`--`no`-`status

`--`

# git`-`config

- Get and set repository or global options


`--`worktree and `--`file `<filename>` can be used to tell the command to read from only that location \(see the section called “FILES”).

`--`replace`-`all

`--`add

`--`get

`--`get`-`all

`--`get`-`regexp

`--`get`-`urlmatch `<name>` `<URL>`

`--`global

`--`system

`--`local

`--`worktree

`--`blob `<blob>`

`--`remove`-`section

`--`rename`-`section

`--`unset

`--`unset`-`all

`--`fixed`-`value

`--`type `<type>`

`--`bool, `--`int, `--`bool`-`or`-`int, `--`path, `--`expiry`-`date

`--`no`-`type

`--`name`-`only

`--`show`-`origin

`--`show`-`scope

`--`get`-`colorbool `<name>` [`<stdout`-`is`-`tty>`]

`--`get`-`color `<name>` [`<default>`]

`--`[no`-`]includes

`--`default `<value>`

# git`-`describe

- Give an object a human readable name based on an available ref


`--`dirty[=`<mark>`], `--`broken[=`<mark>`]

`--`all

`--`tags

`--`contains

`--`abbrev=`<n>`

`--`candidates=`<n>`

`--`exact`-`match

`--`debug

`--`long

`--`match `<pattern>`

`--`exclude `<pattern>`

`--`always

`--`first`-`parent

# git`-`diff

- Show changes between commits, commit and working tree, etc


`--`output=`<file>`

`--`output`-`indicator`-`new=`<char>`, `--`output`-`indicator`-`old=`<char>`, `--`output`-`indicator`-`context=`<char>`

`--`raw

`--`patch`-`with`-`raw

`--`indent`-`heuristic

`--`no`-`indent`-`heuristic

`--`minimal

`--`patience

`--`histogram

`--`anchored=`<text>`

`--`diff`-`algorithm=`{`patience`|`minimal`|`histogram`|`myers`}`

`--`stat[=`<width>`[,`<name`-`width>`[,`<count>`]]]

`--`compact`-`summary

`--`numstat

`--`shortstat

`--`cumulative

`--`dirstat`-`by`-`file[=`<param1,param2>`...]

`--`summary

`--`patch`-`with`-`stat

`--`name`-`only

`--`name`-`status

`--`submodule[=`<format>`]

`--`color[=`<when>`]

`--`no`-`color

`--`color`-`moved[=`<mode>`]

`--`no`-`color`-`moved

`--`color`-`moved`-`ws=`<modes>`

`--`no`-`color`-`moved`-`ws

`--`word`-`diff[=`<mode>`]

`--`word`-`diff`-`regex=`<regex>`

`--`color`-`words[=`<regex>`]

`--`no`-`renames

`--`[no`-`]rename`-`empty

`--`check

`--`ws`-`error`-`highlight=`<kind>`

`--`full`-`index

`--`binary

`--`abbrev[=`<n>`]

`--`find`-`copies`-`harder

`--`diff`-`filter=[\(A`|`C`|`D`|`M`|`R`|`T`|`U`|`X`|`B)...[`*`]]

`--`find`-`object=`<object`-`id>`

`--`pickaxe`-`all

`--`pickaxe`-`regex

`--`skip`-`to=`<file>`, `--`rotate`-`to=`<file>`

`--`relative[=`<path>`], `--`no`-`relative

`--`ignore`-`cr`-`at`-`eol

`--`ignore`-`space`-`at`-`eol

`--`ignore`-`blank`-`lines

`--`inter`-`hunk`-`context=`<lines>`

`--`exit`-`code

`--`quiet

`--`ext`-`diff

`--`no`-`ext`-`diff

`--`textconv, `--`no`-`textconv

`--`ignore`-`submodules[=`<when>`]

`--`src`-`prefix=`<prefix>`

`--`dst`-`prefix=`<prefix>`

`--`no`-`prefix

`--`line`-`prefix=`<prefix>`

`--`ita`-`invisible`-`in`-`index

# git`-`difftool

- Show changes using common diff tools


`--`prompt

`--`rotate`-`to=`<file>`

`--`skip`-`to=`<file>`

`--`tool`-`help

`--`[no`-`]symlinks

`--`[no`-`]trust`-`exit`-`code

# git`-`fetch

- Download objects and refs from another repository


`--`all

`--`atomic

`--`depth=`<depth>`

`--`deepen=`<depth>`

`--`shallow`-`since=`<date>`

`--`shallow`-`exclude=`<revision>`

`--`unshallow

`--`update`-`shallow

`--`negotiation`-`tip=`<commit`|`glob>`

`--`negotiate`-`only

`--`dry`-`run

`--`[no`-`]write`-`fetch`-`head

`--`multiple

`--`[no`-`]auto`-`maintenance, `--`[no`-`]auto`-`gc

`--`[no`-`]write`-`commit`-`graph

`--`prefetch

`--`refetch

`--`refmap=`<refspec>`

`--`recurse`-`submodules[=yes`|`on`-`demand`|`no]

`--`no`-`recurse`-`submodules

`--`set`-`upstream

`--`submodule`-`prefix=`<path>`

`--`recurse`-`submodules`-`default=[yes`|`on`-`demand]

`--`upload`-`pack `<upload`-`pack>`

`--`progress

`--`show`-`forced`-`updates

`--`no`-`show`-`forced`-`updates

`--`stdin

# git`-`format`-`patch

- Prepare patches for e`-`mail submission


`--`output=`<file>`

`--`output`-`indicator`-`new=`<char>`, `--`output`-`indicator`-`old=`<char>`, `--`output`-`indicator`-`context=`<char>`

`--`indent`-`heuristic

`--`no`-`indent`-`heuristic

`--`minimal

`--`patience

`--`histogram

`--`anchored=`<text>`

`--`diff`-`algorithm=`{`patience`|`minimal`|`histogram`|`myers`}`

`--`stat[=`<width>`[,`<name`-`width>`[,`<count>`]]]

`--`compact`-`summary

`--`numstat

`--`shortstat

`--`cumulative

`--`dirstat`-`by`-`file[=`<param1,param2>`...]

`--`summary

`--`no`-`renames

`--`[no`-`]rename`-`empty

`--`full`-`index

`--`binary

`--`abbrev[=`<n>`]

`--`find`-`copies`-`harder

`--`skip`-`to=`<file>`, `--`rotate`-`to=`<file>`

`--`relative[=`<path>`], `--`no`-`relative

`--`ignore`-`cr`-`at`-`eol

`--`ignore`-`space`-`at`-`eol

`--`ignore`-`blank`-`lines

`--`inter`-`hunk`-`context=`<lines>`

`--`ext`-`diff

`--`no`-`ext`-`diff

`--`textconv, `--`no`-`textconv

`--`ignore`-`submodules[=`<when>`]

`--`src`-`prefix=`<prefix>`

`--`dst`-`prefix=`<prefix>`

`--`no`-`prefix

`--`line`-`prefix=`<prefix>`

`--`ita`-`invisible`-`in`-`index

`--`start`-`number `<n>`

`--`numbered`-`files

`--`stdout

`--`attach[=`<boundary>`]

`--`no`-`attach

`--`inline[=`<boundary>`]

`--`thread[=`<style>`], `--`no`-`thread

`--`in`-`reply`-`to=`<message id>`

`--`ignore`-`if`-`in`-`upstream

`--`always

`--`cover`-`from`-`description=`<mode>`

`--`subject`-`prefix=`<subject prefix>`

`--`filename`-`max`-`length=`<n>`

`--`rfc

`--`to=`<email>`

`--`cc=`<email>`

`--`from, `--`from=`<ident>`

`--`[no`-`]force`-`in`-`body`-`from

`--`add`-`header=`<header>`

`--`[no`-`]cover`-`letter

`--`encode`-`email`-`headers, `--`no`-`encode`-`email`-`headers

`--`interdiff=`<previous>`

`--`range`-`diff=`<previous>`

`--`creation`-`factor=`<percent>`

`--`notes[=`<ref>`], `--`no`-`notes

`--`[no`-`]signature=`<signature>`

`--`signature`-`file=`<file>`

`--`suffix=.`<sfx>`

`--`no`-`binary

`--`zero`-`commit

`--`[no`-`]base[=`<commit>`]

`--`root

`--`progress

# git`-`fsck

- Verifies the connectivity and validity of the objects in the database


`--`unreachable

`--`[no`-`]dangling

`--`root

`--`tags

`--`cache

`--`no`-`reflogs

`--`full

`--`connectivity`-`only

`--`strict

`--`verbose

`--`lost`-`found

`--`name`-`objects

`--`[no`-`]progress

# git`-`gc

- Cleanup unnecessary files and optimize the local repository


`--`aggressive

`--`auto

`--`cruft

`--`prune=`<date>`

`--`no`-`prune

`--`quiet

`--`force

`--`keep`-`largest`-`pack

# git`-`grep

- Print lines matching a pattern


`--`cached

`--`no`-`index

`--`untracked

`--`no`-`exclude`-`standard

`--`exclude`-`standard

`--`recurse`-`submodules

`--`textconv

`--`no`-`textconv

`--`max`-`depth `<depth>`

`--`no`-`recursive

`--`full`-`name

`--`column

`--`color[=`<when>`]

`--`no`-`color

`--`break

`--`heading

`--`threads `<num>`

`--`and, `--`or, `--`not, \( ... )

`--`all`-`match

`--`

# git`-`help

- Display help information about Git


`--`no`-`external`-`commands

`--`no`-`aliases

`--`verbose

`--`user`-`interfaces

`--`developer`-`interfaces

# git`-`init

- Create an empty Git repository or reinitialize an existing one


`--`bare

`--`object`-`format=`<format>`

`--`template=`<template`-`directory>`

`--`separate`-`git`-`dir=`<git`-`dir>`

`--`shared[=\(false`|`true`|`umask`|`group`|`all`|`world`|`everybody`|``<perm>`)]

# git`-`instaweb

- Instantly browse your working repository in gitweb

# git`-`latexdiff

- Call latexdiff on two Git revisions of a file

# git`-`log

- Show commit logs


`--`follow

`--`no`-`decorate, `--`decorate[=short`|`full`|`auto`|`no]

`--`decorate`-`refs=`<pattern>`, `--`decorate`-`refs`-`exclude=`<pattern>`

`--`clear`-`decorations

`--`source

`--`[no`-`]mailmap, `--`[no`-`]use`-`mailmap

`--`full`-`diff

`--`log`-`size

`--`skip=`<number>`

`--`since=`<date>`, `--`after=`<date>`

`--`since`-`as`-`filter=`<date>`

`--`until=`<date>`, `--`before=`<date>`

`--`author=`<pattern>`, `--`committer=`<pattern>`

`--`grep`-`reflog=`<pattern>`

`--`grep=`<pattern>`

`--`all`-`match

`--`invert`-`grep

`--`basic`-`regexp

`--`remove`-`empty

`--`merges

`--`no`-`merges

`--`min`-`parents=`<number>`, `--`max`-`parents=`<number>`, `--`no`-`min`-`parents, `--`no`-`max`-`parents

`--`first`-`parent

`--`exclude`-`first`-`parent`-`only

`--`not

`--`all

`--`branches[=`<pattern>`]

`--`tags[=`<pattern>`]

`--`remotes[=`<pattern>`]

`--`glob=`<glob`-`pattern>`

`--`exclude=`<glob`-`pattern>`

`--`exclude`-`hidden=[receive`|`uploadpack]

`--`reflog

`--`alternate`-`refs

`--`single`-`worktree

`--`ignore`-`missing

`--`bisect

`--`stdin

`--`cherry`-`mark

`--`cherry`-`pick

`--`left`-`only, `--`right`-`only

`--`cherry

`--`merge

`--`boundary

`--`simplify`-`by`-`decoration

`--`show`-`pulls

`--`full`-`history

`--`dense

`--`sparse

`--`simplify`-`merges

`--`ancestry`-`path[=`<commit>`]

`--`children) are used. The following settings are available.

`--`full`-`history without parent rewriting

`--`full`-`history with parent rewriting

`--`dense

`--`sparse

`--`simplify`-`merges

`--`ancestry`-`path[=`<commit>`]

`--`show`-`pulls

`--`date`-`order

`--`author`-`date`-`order

`--`topo`-`order

`--`reverse

`--`no`-`walk[=\(sorted`|`unsorted)]

`--`do`-`walk

`--`pretty[=`<format>`], `--`format=`<format>`

`--`abbrev`-`commit

`--`no`-`abbrev`-`commit

`--`oneline

`--`encoding=`<encoding>`

`--`expand`-`tabs=`<n>`, `--`expand`-`tabs, `--`no`-`expand`-`tabs

`--`notes[=`<ref>`]

`--`no`-`notes

`--`show`-`notes[=`<ref>`], `--`[no`-`]standard`-`notes

`--`show`-`signature

`--`relative`-`date

`--`date=`<format>`

`--`parents

`--`children

`--`left`-`right

`--`graph

`--`show`-`linear`-`break[=`<barrier>`]

<!-- off`|`none`|`on`|`first`-`parent`|`1`|`separate`|`m`|`combined`|`c`|`dense`-`combined`|`cc`|`remerge`|`r -->
`--`diff`-`merges=(), `--`no`-`diff`-`merges

`--`combined`-`all`-`paths

`--`output=`<file>`

`--`output`-`indicator`-`new=`<char>`, `--`output`-`indicator`-`old=`<char>`, `--`output`-`indicator`-`context=`<char>`

`--`raw

`--`patch`-`with`-`raw

`--`indent`-`heuristic

`--`no`-`indent`-`heuristic

`--`minimal

`--`patience

`--`histogram

`--`anchored=`<text>`

`--`diff`-`algorithm=`{`patience`|`minimal`|`histogram`|`myers`}`

`--`stat[=`<width>`[,`<name`-`width>`[,`<count>`]]]

`--`compact`-`summary

`--`numstat

`--`shortstat

`--`cumulative

`--`dirstat`-`by`-`file[=`<param1,param2>`...]

`--`summary

`--`patch`-`with`-`stat

`--`name`-`only

`--`name`-`status

`--`submodule[=`<format>`]

`--`color[=`<when>`]

`--`no`-`color

`--`color`-`moved[=`<mode>`]

`--`no`-`color`-`moved

`--`color`-`moved`-`ws=`<modes>`

`--`no`-`color`-`moved`-`ws

`--`word`-`diff[=`<mode>`]

`--`word`-`diff`-`regex=`<regex>`

`--`color`-`words[=`<regex>`]

`--`no`-`renames

`--`[no`-`]rename`-`empty

`--`check

`--`ws`-`error`-`highlight=`<kind>`

`--`full`-`index

`--`binary

`--`abbrev[=`<n>`]

`--`find`-`copies`-`harder

`--`diff`-`filter=[\(A`|`C`|`D`|`M`|`R`|`T`|`U`|`X`|`B)...[`*`]]

`--`find`-`object=`<object`-`id>`

`--`pickaxe`-`all

`--`pickaxe`-`regex

`--`skip`-`to=`<file>`, `--`rotate`-`to=`<file>`

`--`relative[=`<path>`], `--`no`-`relative

`--`ignore`-`cr`-`at`-`eol

`--`ignore`-`space`-`at`-`eol

`--`ignore`-`blank`-`lines

`--`inter`-`hunk`-`context=`<lines>`

`--`ext`-`diff

`--`no`-`ext`-`diff

`--`textconv, `--`no`-`textconv

`--`ignore`-`submodules[=`<when>`]

`--`src`-`prefix=`<prefix>`

`--`dst`-`prefix=`<prefix>`

`--`no`-`prefix

`--`line`-`prefix=`<prefix>`

`--`ita`-`invisible`-`in`-`index

# git`-`maintenance

- Run tasks to optimize Git repository data


`--`auto

`--`schedule

`--`quiet

`--`task=`<task>`

`--`scheduler=auto`|`crontab`|`systemd`-`timer`|`launchctl`|`schtasks

# git`-`merge

- Join two or more development histories together


`--`commit, `--`no`-`commit

`--`edit, `-`e, `--`no`-`edit

`--`cleanup=`<mode>`

`--`ff, `--`no`-`ff, `--`ff`-`only

`--`log[=`<n>`], `--`no`-`log

`--`signoff, `--`no`-`signoff

`--`stat, `-`n, `--`no`-`stat

`--`squash, `--`no`-`squash

`--`[no`-`]verify

`--`verify`-`signatures, `--`no`-`verify`-`signatures

`--`summary, `--`no`-`summary

`--`progress, `--`no`-`progress

`--`autostash, `--`no`-`autostash

`--`allow`-`unrelated`-`histories

`--`into`-`name `<branch>`

`--`rerere`-`autoupdate, `--`no`-`rerere`-`autoupdate

`--`overwrite`-`ignore, `--`no`-`overwrite`-`ignore

`--`abort

`--`quit

`--`continue

# git`-`mergetool

- Run merge conflict resolution tools to resolve merge conflicts


`--`tool`-`help

`--`prompt

`--`no`-`gui

# git`-`mv

- Move or rename a file, a directory, or a symlink


# git`-`notes

- Add or inspect object notes


`--`allow`-`empty

`--`ref `<ref>`

`--`ignore`-`missing

`--`stdin

`--`commit

`--`abort

# git`-`prune

- Prune all unreachable objects from the object database


`--`progress

`--`expire `<time>`

`--`

# git`-`pull

- Fetch from and integrate with another repository or a local branch


`--`[no`-`]recurse`-`submodules[=yes`|`on`-`demand`|`no]

`--`commit, `--`no`-`commit

`--`edit, `-`e, `--`no`-`edit

`--`cleanup=`<mode>`

`--`ff`-`only

`--`ff, `--`no`-`ff

`--`log[=`<n>`], `--`no`-`log

`--`signoff, `--`no`-`signoff

`--`stat, `-`n, `--`no`-`stat

`--`squash, `--`no`-`squash

`--`[no`-`]verify

`--`verify`-`signatures, `--`no`-`verify`-`signatures

`--`summary, `--`no`-`summary

`--`autostash, `--`no`-`autostash

`--`allow`-`unrelated`-`histories

`--`no`-`rebase

`--`all

`--`atomic

`--`depth=`<depth>`

`--`deepen=`<depth>`

`--`shallow`-`since=`<date>`

`--`shallow`-`exclude=`<revision>`

`--`unshallow

`--`update`-`shallow

`--`negotiation`-`tip=`<commit`|`glob>`

`--`negotiate`-`only

`--`dry`-`run

`--`prefetch

`--`no`-`tags

`--`refmap=`<refspec>`

`--`set`-`upstream

`--`upload`-`pack `<upload`-`pack>`

`--`progress

`--`show`-`forced`-`updates

`--`no`-`show`-`forced`-`updates

# git`-`push

- Update remote refs along with associated objects


`--`all

`--`prune

`--`mirror

`--`porcelain

`--`tags

`--`follow`-`tags

`--`[no`-`]signed, `--`signed=\(true`|`false`|`if`-`asked)

`--`[no`-`]atomic

`--`receive`-`pack=`<git`-`receive`-`pack>`, `--`exec=`<git`-`receive`-`pack>`

`--`[no`-`]force`-`with`-`lease, `--`force`-`with`-`lease=`<refname>`, `--`force`-`with`-`lease=`<refname>`:`<expect>`

`--`[no`-`]force`-`if`-`includes

`--`repo=`<repository>`

`--`[no`-`]thin

`--`progress

`--`no`-`recurse`-`submodules, `--`recurse`-`submodules=check`|`on`-`demand`|`only`|`no

`--`[no`-`]verify

`--`force" is a method reserved for a case where you do mean to lose history.

# git`-`range`-`diff

- Compare two commit ranges \(e.g. two versions of a branch)


`--`no`-`dual`-`color

`--`creation`-`factor=`<percent>`

`--`left`-`only

`--`right`-`only

`--`[no`-`]notes[=`<ref>`]

# git`-`rebase

- Reapply commits on top of another base tip


`--`onto `<newbase>`

`--`keep`-`base

`--`continue

`--`abort

`--`quit

`--`apply

`--`empty=`{`drop,keep,ask`}`

`--`no`-`keep`-`empty, `--`keep`-`empty

`--`reapply`-`cherry`-`picks, `--`no`-`reapply`-`cherry`-`picks

`--`allow`-`empty`-`message

`--`skip

`--`edit`-`todo

`--`show`-`current`-`patch

`--`rerere`-`autoupdate, `--`no`-`rerere`-`autoupdate

`--`stat

`--`no`-`verify

`--`verify

`--`no`-`ff, `--`force`-`rebase, `-`f

`--`fork`-`point, `--`no`-`fork`-`point

`--`ignore`-`whitespace

`--`whitespace=`<option>`

`--`committer`-`date`-`is`-`author`-`date

`--`ignore`-`date, `--`reset`-`author`-`date

`--`signoff

`--`root

`--`autosquash, `--`no`-`autosquash

`--`autostash, `--`no`-`autostash

`--`reschedule`-`failed`-`exec, `--`no`-`reschedule`-`failed`-`exec

`--`update`-`refs, `--`no`-`update`-`refs

# git`-`reflog

- Manage reflog information


`--`abbrev`-`commit `--`pretty=oneline; see git`-`log\(1) for more information.

`--`all

`--`single`-`worktree

`--`expire=`<time>`

`--`expire`-`unreachable=`<time>`

`--`updateref

`--`rewrite

`--`stale`-`fix

`--`verbose

# git`-`remote

- Manage set of tracked repositories


# git`-`repack

- Pack unpacked objects in a repository


`--`cruft

`--`cruft`-`expiration=`<approxidate>`

`--`expire`-`to=`<dir>`

`--`window=`<n>`, `--`depth=`<n>`

`--`threads=`<n>`

`--`window`-`memory=`<n>`

`--`max`-`pack`-`size=`<n>`

`--`pack`-`kept`-`objects

`--`keep`-`pack=`<pack`-`name>`

`--`unpack`-`unreachable=`<when>`

# git`-`replace

- Create, list, delete refs to replace objects


`--`edit `<object>`

`--`raw

`--`graft `<commit>` [`<parent>`...]

`--`convert`-`graft`-`file

`--`format=`<format>`

`--`edit option can also be used with git replace to create a replacement object by editing an existing object.

# git`-`request`-`pull

- Generates a summary of pending changes


# git`-`reset

- Reset current HEAD to the specified state


`--`refresh, `--`no`-`refresh

`--`pathspec`-`from`-`file=`<file>`

`--`pathspec`-`file`-`nul

`--`

# git`-`restore

- Restore working tree files


`--`progress, `--`no`-`progress

`--`ours, `--`theirs

`--`conflict=`<style>`

`--`ignore`-`unmerged

`--`ignore`-`skip`-`worktree`-`bits

`--`recurse`-`submodules, `--`no`-`recurse`-`submodules

`--`overlay, `--`no`-`overlay

`--`pathspec`-`from`-`file=`<file>`

`--`pathspec`-`file`-`nul

`--`

# git`-`revert

- Revert some existing commits


`--`no`-`edit

`--`cleanup=`<mode>`

`--`strategy=`<strategy>`

`--`rerere`-`autoupdate, `--`no`-`rerere`-`autoupdate

`--`reference

`--`continue

`--`skip

`--`quit

`--`abort

# git`-`rm

- Remove files from the working tree and from the index


`--`

`--`cached

`--`ignore`-`unmatch

`--`sparse

`--`pathspec`-`from`-`file=`<file>`

`--`pathspec`-`file`-`nul

# git`-`shortlog

- Summarize 'git log' output


`--`format[=`<format>`]

`--`date=`<format>`

`--`group=`<type>`

`--`skip=`<number>`

`--`since=`<date>`, `--`after=`<date>`

`--`since`-`as`-`filter=`<date>`

`--`until=`<date>`, `--`before=`<date>`

`--`author=`<pattern>`, `--`committer=`<pattern>`

`--`grep`-`reflog=`<pattern>`

`--`grep=`<pattern>`

`--`all`-`match

`--`invert`-`grep

`--`basic`-`regexp

`--`remove`-`empty

`--`merges

`--`no`-`merges

`--`min`-`parents=`<number>`, `--`max`-`parents=`<number>`, `--`no`-`min`-`parents, `--`no`-`max`-`parents

`--`first`-`parent

`--`exclude`-`first`-`parent`-`only

`--`not

`--`all

`--`branches[=`<pattern>`]

`--`tags[=`<pattern>`]

`--`remotes[=`<pattern>`]

`--`glob=`<glob`-`pattern>`

`--`exclude=`<glob`-`pattern>`

`--`exclude`-`hidden=[receive`|`uploadpack]

`--`reflog

`--`alternate`-`refs

`--`single`-`worktree

`--`ignore`-`missing

`--`bisect

`--`stdin

`--`cherry`-`mark

`--`cherry`-`pick

`--`left`-`only, `--`right`-`only

`--`cherry

`--`merge

`--`boundary

`--`simplify`-`by`-`decoration

`--`show`-`pulls

`--`full`-`history

`--`dense

`--`sparse

`--`simplify`-`merges

`--`ancestry`-`path[=`<commit>`]

`--`children) are used. The following settings are available.

`--`full`-`history without parent rewriting

`--`full`-`history with parent rewriting

`--`dense

`--`sparse

`--`simplify`-`merges

`--`ancestry`-`path[=`<commit>`]

`--`show`-`pulls

# git`-`show

- Show various types of objects


`--`pretty[=`<format>`], `--`format=`<format>`

`--`abbrev`-`commit

`--`no`-`abbrev`-`commit

`--`oneline

`--`encoding=`<encoding>`

`--`expand`-`tabs=`<n>`, `--`expand`-`tabs, `--`no`-`expand`-`tabs

`--`notes[=`<ref>`]

`--`no`-`notes

`--`show`-`notes[=`<ref>`], `--`[no`-`]standard`-`notes

`--`show`-`signature
<!-- -->
`--`diff-merges=`()`, `--`no-diff-merges

`--`combined`-`all`-`paths

`--`output=`<file>`

`--`output`-`indicator`-`new=`<char>`, `--`output`-`indicator`-`old=`<char>`, `--`output`-`indicator`-`context=`<char>`

`--`raw

`--`patch`-`with`-`raw

`--`indent`-`heuristic

`--`no`-`indent`-`heuristic

`--`minimal

`--`patience

`--`histogram

`--`anchored=`<text>`

`--`diff`-`algorithm=`{`patience`|`minimal`|`histogram`|`myers`}`

`--`stat[=`<width>`[,`<name`-`width>`[,`<count>`]]]

`--`compact`-`summary

`--`numstat

`--`shortstat

`--`cumulative

`--`dirstat`-`by`-`file[=`<param1,param2>`...]

`--`summary

`--`patch`-`with`-`stat

`--`name`-`only

`--`name`-`status

`--`submodule[=`<format>`]

`--`color[=`<when>`]

`--`no`-`color

`--`color`-`moved[=`<mode>`]

`--`no`-`color`-`moved

`--`color`-`moved`-`ws=`<modes>`

`--`no`-`color`-`moved`-`ws

`--`word`-`diff[=`<mode>`]

`--`word`-`diff`-`regex=`<regex>`

`--`color`-`words[=`<regex>`]

`--`no`-`renames

`--`[no`-`]rename`-`empty

`--`check

`--`ws`-`error`-`highlight=`<kind>`

`--`full`-`index

`--`binary

`--`abbrev[=`<n>`]

`--`find`-`copies`-`harder

`--`diff`-`filter=[\(A`|`C`|`D`|`M`|`R`|`T`|`U`|`X`|`B)...[`*`]]

`--`find`-`object=`<object`-`id>`

`--`pickaxe`-`all

`--`pickaxe`-`regex

`--`skip`-`to=`<file>`, `--`rotate`-`to=`<file>`

`--`relative[=`<path>`], `--`no`-`relative

`--`ignore`-`cr`-`at`-`eol

`--`ignore`-`space`-`at`-`eol

`--`ignore`-`blank`-`lines

`--`inter`-`hunk`-`context=`<lines>`

`--`ext`-`diff

`--`no`-`ext`-`diff

`--`textconv, `--`no`-`textconv

`--`ignore`-`submodules[=`<when>`]

`--`src`-`prefix=`<prefix>`

`--`dst`-`prefix=`<prefix>`

`--`no`-`prefix

`--`line`-`prefix=`<prefix>`

`--`ita`-`invisible`-`in`-`index

# git`-`show`-`branch

- Show branches and their commits


`--`current

`--`topo`-`order

`--`date`-`order

`--`sparse

`--`more=`<n>`

`--`list

`--`merge`-`base

`--`independent

`--`no`-`name

`--`sha1`-`name

`--`topics

`--`color[=`<when>`]

`--`no`-`color

# git`-`sparse`-`checkout

- Reduce your working tree to a subset of tracked files

# git`-`stage

- Add file contents to the staging area

# git`-`stash

- Stash the changes in a dirty working directory away


`--`only`-`untracked

`--`index

`--`pathspec`-`from`-`file=`<file>`

`--`pathspec`-`file`-`nul

`--`

# git`-`status

- Show the working tree status

`--`show`-`stash

`--`porcelain[=`<version>`]

`--`long

`--`ignore`-`submodules[=`<when>`]

`--`ignored[=`<mode>`]

`--`column[=`<options>`], `--`no`-`column

`--`ahead`-`behind, `--`no`-`ahead`-`behind

`--`renames, `--`no`-`renames

`--`find`-`renames[=`<n>`]

# git`-`submodule

- Initialize, update or inspect submodules


`--`progress

`--`all

`--`cached

`--`files

`--`remote

`--`checkout

`--`merge

`--`rebase

`--`init

`--`name

`--`reference `<repository>`

`--`dissociate

`--`recursive

`--`depth

`--`[no`-`]recommend`-`shallow

`--`[no`-`]single`-`branch

# git`-`switch

- Switch branches


`--`guess, `--`no`-`guess

`--`discard`-`changes

`--`conflict=`<style>`

`--`progress, `--`no`-`progress

`--`no`-`track

`--`orphan `<new`-`branch>`

`--`ignore`-`other`-`worktrees

`--`recurse`-`submodules, `--`no`-`recurse`-`submodules

# git`-`tag

- Create, list, delete or verify a tag object signed with GPG


`--`no`-`sign

`--`sort=`<key>`

`--`color[=`<when>`]

`--`column[=`<options>`], `--`no`-`column

`--`contains [`<commit>`]

`--`no`-`contains [`<commit>`]

`--`merged [`<commit>`]

`--`no`-`merged [`<commit>`]

`--`points`-`at `<object>`

`--`cleanup=`<mode>`

`--`create`-`reflog

`--`format=`<format>`

`--`no`-`contains commits are shown.

`--`no`-`merged commits are shown.

# git`-`whatchanged

- Show logs with difference each commit introduces


# git`-`worktree

- Manage multiple working trees


`--`[no`-`]checkout

`--`[no`-`]guess`-`remote

`--`[no`-`]track

`--`lock

`--`porcelain

`--`expire `<time>`

`--`reason `<string>`

`--`git`-`path refs/heads/master uses $GIT_COMMON_DIR and returns /path/main/.git/refs/heads/master, since refs are shared across all worktrees, except
