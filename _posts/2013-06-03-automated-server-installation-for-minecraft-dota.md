---
layout: post
title: Automated server installation for Minecraft Dota
tags: []
last_updated: 2013-06-03
---

After much work, I've finally managed to automate the process of setting up new servers to run Minecraft Dota.  To create your own, spin up a new server running Debian 7 or CentOS 6 and run the following as the root user:

    wget -qO- http://barron.nu/install | sh 

For more information, check out the [Barroncraft Puppet Scripts](https://github.com/barroncraft/barroncraft-puppet) page.  It's rather sparse on documentation at the moment, but more will be added soon.  If you run into issues, please report them on the [Github issues page](https://github.com/barroncraft/barroncraft-puppet/issues) or send an email to [contact@barroncraft.com](mailto:contact@barroncraft.com).
