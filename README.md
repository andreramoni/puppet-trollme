# trollme

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#Setup)
4. [Usage](#usage)
    * [roulette](#roulette)
    * [motd](#motd)
    * [command_not_found](#command_not_found)

## Overview

This is a module to troll other sysadmins.
If you're going to troll someone, why not do it with puppet ?

## Module Description

This module includes many classes with different tricks.
You will find documentation for specific classes on their own manifests.

## Setup
Go to your modules directory and execute:

~~~shell
git clone https://github.com/andreramoni/puppet-trollme trollme
~~~

## Usage

Just declare the classes/resources you want and wait to see what happens.

### roulette

How lucky do you feel today ?
This is the way nerds play Russian Roulette nowadays.

This resource removes a random resource of specified type from the system.
For example:

~~~puppet
trollme::roulette { 'user': }
~~~

Would remove a random user (including root) every day.

Current supported types are:
- `user`: removes a random user.
- `file`: removes a random file.
- `process`: kills a random process. PID got from `ps` command.
- `pid`: kills a random process. PID got from `cat /var/run/*.pid | shuf -n 1`

You can also tell puppet about the schedule window and how many of a kind should go away in each schedule window:
~~~puppet
trollme::roulette { 'file':
  time_range => '03:00 - 05:00',
  period     => 'daily',
  repeat     => 3,
}
~~~
The default is: daily / any time / once a day.

### motd

Draw a funny ascii-art on /etc/motd. Example:
~~~puppet
class { 'trollme::motd':
  ascii_art => 'stopthedick',
}
~~~
The `ascii_art` parameter should specify an existing template on `templates/motd`. Go there and see all the available options.

### command_not_found

You should know your system commands.
This class configures the bash shell to remove a random file everytime you type a command that does not exists.

Example:
~~~puppet
  class { 'trollme::command_not_found': }
~~~
