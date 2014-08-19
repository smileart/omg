```
       _____           _ _                  _______ _
      / ____|         (_) |         ____   |__   __( )
     | (___  _ __ ___  _| | ___    / __ \ _ __| |  |/ ___
      \___ \| '_ ` _ \| | |/ _ \  / / _` | '__| |    / __|
      ____) | | | | | | | |  __/ | | (_| | |  | |    \__ \
   __|_____/|_| |_|_|_|_|_|\___|  \ \__,_|_|  |_|   _|___/
  / __ \|  \/  |/ ____| | |_   _|  \____/ | |      | | |
 | |  | | \  / | |  __| |   | |  _ __  ___| |_ __ _| | | ___ _ __
 | |  | | |\/| | | |_ | |   | | | '_ \/ __| __/ _` | | |/ _ \ '__|
 | |__| | |  | | |__| |_|  _| |_| | | \__ \ || (_| | | |  __/ |
  \____/|_|  |_|\_____(_) |_____|_| |_|___/\__\__,_|_|_|\___|_|
    * One More Gear v.0.0.1

```

WARNING!
===============
Brfore using any of those scripts, make sure you have read it's code and agree with every action it's going to do with your system!
This set of scripts is distributed in the hope that it will be useful, but is provided AS IS with ABSOLUTELY NO WARRANTY!


What
===============

![Vim and Tmux in OMG](https://bitbucket.org/repo/xgB9xp/images/1476995265-screenshot.png "Vim and Tmux in OMG")

Why
===============
Just one more handcrafted gear to follow DRY principle and stop doing things again and again.


How
===============

Some common ways of packages installation:

```
./omg_install.sh packages.sh # install ALL basic packages

./omg_install.sh package_name # install one package
./omg_install.sh package_name --force # install package even if it's already exists
./omg_install.sh package_name package2_name # install couple of packages
```

How to override .vimrc

```
# just run vim like that (or create alias in ~/.user.aliases)
vim -u ~/.your_own_vim_rc # where you could source my .vimrc or do anything you want
```


Virtual
===============
This "installer" created with a purpose of usage in a virtual dev environment, to separate your env and tools from host system to avoid a dependency hell and packages mess.

After installation of Vagrant package from OMG, you could do this:

```./omg/vagrantup username```


tmux
===============
OMG uses `tmux` as your usual working environment and as pairing instrument. All your `zsh` or `vim` sessions are supposed to run nested inside `tmux` session.

OMG's `tmux` comes with a nice panel and a bunch of useful tools and bindings.

![Tmux panel in OMG](https://bitbucket.org/repo/xgB9xp/images/823582099-tmux_panel.png "Tmux panel in OMG")

git
===============

Git in OMG is packed with a bunch of tools and presets. First of all it's aliases for convenient and fast everyday work and also a couple of nice utilities to make routines and custom tasks even more simple.

### Aliases

````
# Git Aliases
alias gs='git status'
alias gstsh='git stash'
alias gst='git stash'
alias gshw='git show'
alias gshow='git show'
alias gi='vim .gitignore'
alias gcm='git ci -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias ga='git add -A'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git pull'
alias glg='git l'
alias glog='git l'
alias co='git co'
alias gf='git fetch'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
alias gbd='git b -D -w'
alias gdc='git diff --cached -w'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'
alias gbg='git bisect good'
alias gbb='git bisect bad'
alias gbmv='git branch -m'

# Stash (s)
alias gsa='git stash apply'
alias gsx='git stash drop'
alias gsX='git-stash-clear-interactive'
alias gsl='git stash list'
alias gsL='git-stash-dropped'
alias gsd='git stash show --patch --stat'
alias gsp='git stash pop'
alias gsr='git-stash-recover'
alias gss='git stash save --include-untracked'
alias gsS='git stash save --patch --no-keep-index'
alias gsw='git stash save --include-untracked --keep-index'

````

### [gitsu](http://drrb.github.io/gitsu/)

Little tool which helps to manage your projects' Git users by making it easy to switch between users.

Gitsu lets you:

* quickly switch between Git users
* switch to multiple users at once for paring

````
$ git su --add "John Galt <jgalt@example.com>"
User 'John Galt <jgalt@example.com>' added to users
$ git su --add "Raphe Rackstraw <rack@example.com>"
User 'Raphe Rackstraw <rack@example.com>' added to users

$ git su jg
Switched to user John Galt <jgalt@example.com>
$ git su raphe
Switched to user Raphe Rackstraw <rack@example.com>
$ git su jg rr
Switched to user 'John Galt and Raphe Rackstraw <dev+jgalt+rack@example.com>'
````

### [Legit](http://www.git-legit.org/)

Legit is a complementary command-line interface for Git, optimized for workflow simplicity. It is heavily inspired by GitHub for Mac.

````
$ git sync
# Syncronizes current branch. Auto-merge/rebase, un/stash.

$ git switch <branch>
# Switches to branch. Stashes and restores unstaged changes.

$ git publish <branch>
# Publishes branch to remote server.

$ git unpublish <branch>
# Removes branch from remote server.

$ git branches
# Nice & pretty list of branches + publication status.
````

Also OMG's ZSH `antigen` plugins provide convenient and pretty smart autocompletion for git commands, branches, remote branches and so on. And allow you to use such branch conventions as [git-flow](https://github.com/nvie/gitflow).


Pairing
===============
OMG allows you easily setup pairing sessions to work remotely on the same task. Here is basic workflow to setup and start pairing on your OMG environment

### If you are firewall/router admin ###

```
> add_pair_user test # create new user for remote session with 'name' login
Added user: test
User password: KVBK8CFO@pi$&I3JMrCnP&^exm3F+(80 # save this!!!

> wemux  # to login yourself to the wemux session and/or start server
> ext_ip # to print your external IP

> ssh test@192.168.0.101 # to login your pair user on LAN
> ssh test@<ext-ip>      # to login your pair user from outside the LAN

> wemux users # to list currently connected users inside wemux session
```

Edit user's `.bash_profile` file to change default client mode (default configured mode is: mirror). Other modes could be: pair — to allow user to work with you; rogue — to allow user to create his own windows.

WARNING: DO NOT delete `; exit` command after default mode in user's `.bash_profile` which disconnects him on detachment.

### If you are NOT firewall/router admin ###

Another way to pair with remote user in OMG is to use `tmate` command. Before it you have to quit your current tmux session with `C-d`. After that run `tmate` command and execute `tmate show-messages` to copy/paste SSH line for read-only or full pair modes. Send that command to your mate and… enjoy. To finish session use `C-d` again.