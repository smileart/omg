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

![Vim and Tmux in OMG](http://imageshack.com/a/img31/7053/g8ox.png "Vim and Tmux in OMG")

Why
===============

How
===============

Some common ways of packages installation:

```
./omg_install.sh packages.sh # install ALL basic packages

./omg_install.sh package_name # install one package
./omg_install.sh package_name --force # install package even if exists
./omg_install.sh package_name package2_name # install couple of packages
```

How to override .vimrc

```
# just run vim like that (or create alias in ~/.user.aliases)
vim -u ~/.your_own_vim_rc # where you could source my .vimrc or do anything
```


Virtual
===============
This "installer" created with purpose of usage in virtual dev environment, to separate env and tool from host system to avoid dependency hell and packages mess.

After installation of Vagrant package from OMG, you could do this:

```./omg/vagrantup username```


Pairing
===============
OMG allows you easily setup pairing sessions to work remotely on the same task. Here is basic workflow to setup and start pairing on your OMG environment

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

Edit user's `.bash_profile` file to change default client mode (default configured mode is: mirror). Other modes could be: pair — to allow user to work with you; rogue — to allow user to create his own window.

WARNING: DO NOT delete `; exit` command after default mode in user's `.bash_profile` which disconnects him on detachment.

Another way to pair with remote user in OMG is to use `tmate` command. Before you have to quit your current tmux session with `C-d`. After `tmate` command, execute `tmate show-messages` to copy/paste SSH command for read-only and full pair modes. Send that command to your mate and… enjoy. To finish session use `C-d` again.