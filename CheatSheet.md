# Summary

This is a quick reference for commands.  Print these PDFs out so that you can reference them as you do terminal work.

*  English
  *  [Cheat Sheet by Dave Child](https://www.cheatography.com/davechild/cheat-sheets/linux-command-line/pdf/)
  *  [Another Cheat Sheet by FOSS](https://files.fosswire.com/2007/08/fwunixref.pdf)
  *  [Git Cheat Sheet](https://services.github.com/on-demand/downloads/github-git-cheat-sheet.pdf)
*  日本語
  *  [FOSSによりチートシート](http://www.yotabanana.com/misc/fwunixref_ja.pdf)
  *  [Gitチートシート](https://services.github.com/on-demand/downloads/ja/github-git-cheat-sheet.pdf)


# Practice

Create your workspace.

See what is inside your HOME directory.

```bash
cd $HOME
ls $HOME
```

Check your user name and user id.

```bash
echo $USER
id -u $USER
```

Create the working directory (for your development work).

```bash
export WORKDIR=$HOME/localwork
mkdir $WORKDIR
```


# Git

[Git](https://en.wikipedia.org/wiki/git) tracks source code.

Download some code from the code-sharing site [Github.com](https://github.com).

```bash
cd $WORKDIR
git clone https://github.com/samurai-fintech/basic-practice basic-practice
cd basic-practice
```

Software code usually is developed across multiple versions.  For example, a company might have a Beta version of their software.  Each software version gets its own branch in Git.  Let's see what branches have been created so far.

```bash
git branch
git branch -r
```

Make a local branch.

```bash
git checkout -b my-branch
```

Make some changes.

```bash
touch hello-world.txt
git status
git add .
git status
git commit -m "my first commit"
git branch
git status
```
