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