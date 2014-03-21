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
Brfore using any of those scripts, make sure you have read it's code and agree with every action it's going to do with your system! This set of scripts is distributed in the hope that it will be useful, but is provided AS IS with ABSOLUTELY NO WARRANTY!


What
===============

Why
===============

How
===============

Virtual
===============
This "installer" created with purpose of usage in virtual dev environment, to separate env and tool from host system to avoid dependency hell and packages mess.

After installation of Vagrant package from OMG, you could do this:

```
vagtant init 'something/ubuntu'
vagrant up
vagrant ssh
sudo adduser username
sudo adduser username sudo
sudo cp -r ~/.ssh/ /home/username/
sudo chown -R username:username /home/username/.ssh
^D
echo 'config.vm.synced_folder "~/omg", "/home/username/omg"' >> ~/Vagrantfile
echo 'config.ssh.username = "username"' >> ~/Vagrantfile
echo 'config.vm.network :public_network' # 2nd interface bridged mode
vagrant ssh

# ===

cd ~/omg; ./omg_install.sh
```
