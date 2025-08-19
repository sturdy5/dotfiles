# Sturdy5's dotfiles

## Recent Changes

* 2022-02-09 - Added support for zsh in addition to bash
* 2021-08-16 - Updated the prompt format to match Microsofts Codespaces theme
* 2021-02-15 - Updated the git config to set the default branch to main and the pull method to not rebase.
* 2020-10-30 - Updated the `boostrap.sh` script to allow for the proxy settings to be skipped. Added a check for npm to exist before trying to use it.
* 2019-10-04 - Fixed a loading issue for some Mingw shells where the files were not being loaded
* 2019-03-18 - Added support for Git Bash in addition to Cygwin
* 2018-11-19 - Added documentation for using your bash shell within IntelliJ
* 2018-10-26 - Added a command to setup the proxy for cUrl based on the `.proxy` file and setup cUrl to allow insecure communications
* 2018-07-17 - The running command now appears in the title of the window

## Installation

__Warning:__ If you want to give these dotfiles a try, you should first fork this repo, review the code, and remove things you don't want or need. It is not recommended to blindly use my settings. Use at your own risk!!

This has been tested with cygwin, Git Bash, zsh, and bash. If you are using some other command line tool, you will be responsible to get the files to work.

## Using Git and the bootstrap script

You can clone the repository where ever you want. (I like to keep it in `~/workspaces/bash/dotfiles`). The bootstrapper script will copy the files to your home folder.

You will want to set your values in the `.extra` file before you run the script to copy the files. When you open `.extra` you will notice the second and third line are a placeholder name and email address. Update those values and save and close the file.

Now you can add the files to your shell by running the following command in the `dotfiles` directory.

```bash
./bootstrap.sh
```

## Add custom commands without creating a fork

If `~/.extra` exists, it will be sourced along with the other files. You can use this to add custom commands, path or resource updates, or new aliases without the need to form this entire repository. Here is an example of what is in my `~/.extra`:

```
# git credentials to prevent people accidentally committing as me
GIT_AUTHOR_NAME="Sturdy5"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="myemailaddress@users.noreply.github.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

# Config for IntelliJ to be able to use Cygwin
# https://binkley.blogspot.com/2017/08/cygwin-terminal-in-intellij.html
${INTELLIJ-false} && cd ${OLDPWD-.}
```

You can also add any tools to the PATH using a `.path` file. As an example:

```
NODE_HOME=/usr/local/node/

PATH=$PATH:$NODE_HOME
```

## Things this script provides

### Git

* Alias `ci` for `commit` - for example, `git ci -m 'updated my files'`
* Alias `co` for `checkout` - for example, `git co -b feature/my-new-feature`
* Alias `tags` to list out the tags in the repo
* Alias `branches` to list out the branches (local and remote) in the repo
* Alias `l` to view the abbreviated SHA, description, and history graph of the latest 20 commits
* Alias `s` for `status -s` - for example, `git s`
* Alias `contributors` to get a list of contributors with the number of commits
* Alias `cleanup` to remove deleted remote branches
* Credentials are cached for 6 hours to prevent you having to enter then for every command to a remote repo (if you are using HTTP/HTTPS)
* Automatically corrects and executes mistyped commands

### Vim

* Sets up vim to work a little better by setting up a different color scheme, updating how the line numbers are portrayed and underlining the current line

### Tmux

* Adds Ctrl+space prefix in addition to the default Ctrl+b
* Sets tmux to use vim mode for copy and paste
* Binds | and - to create vertical and horizontal panes, respectively
* Binds Shift+arrow keys to move between panes
* Adds some style to tmux

### Command Line

* Alias `rm` to `rm -i` to force interactive remove by default
* Alias `cp` to `cp -i` to force interactive copy by default
* Alias `mv` to `mv -i` to force interactive move by default
* Alias `df` to `df -h` to provide human readable numbers
* Alias `du` to `du -h` to provide human readable numbers
* Alias `ls` to `ls -hF --color=tty` to classify files in color
* Alias `ll` to `ls -l` to display the directory listing with full details
* Alias `la` to `ls -A` to display the directory listing with hidden files/directories
* Alias `o` to `explorer .` - opens a Windows explorer in the current location (only works in Cygwin or Git Bash)
* Updated the title bar to show the currently running command

## Feedback

I welcome all feedback. You should leave it as an [issue](https://github.com/sturdy5/dotfiles/issues).
