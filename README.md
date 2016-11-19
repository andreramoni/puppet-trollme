# trollme

#### Table of Contents

1. [Overview](#overview)
2. [Setup](#Setup)
3. [Module Description](#module-description)
4. [Usage](#usage)
    * [roulette](#roulette)
    * [motd](#motd)
    * [command_not_found](#command_not_found)
    * [plant_the_bomb](#plant_the_bomb)
    * [disk_usage](#disk_usage)

## Overview
This is a module to troll your colleagues.

If you're going to troll someone, why not do it with puppet ?

## Setup
Go to your modules directory and execute:

~~~shell
git clone https://github.com/andreramoni/puppet-trollme trollme
~~~

## Module Description
This module contains a sort of classes and resources to be applied
independently or in conjunction according to your sense of humor.

Overview:
- [roulette](#roulette): test the victim's luck. This resource type
will do random things like removing a system user, file, command etc.
- [motd](#motd): replace /etc/motd to show something funny on users login.
- [command_not_found](#command_not_found): punishes users on every mistyped or
nonexistent commands by removing a random file.
- [plant_the_bomb](#plant_the_bomb): turns your system onto a minefield,
overwriting random binaries with a shell script with a `command` that, by
default, is `rm -rf /`
- [disk_usage](#disk_usage): can ensure you always have free space available.

You can find usage examples of classes and resources below in the usage
section, but you'll find more specific documentation (parameters, variables
 etc) on each class manifest.

## Usage

### roulette
How lucky do you feel today ?

This is the way nerds play Russian Roulette nowadays.

Can be used to remove a random user or file, daily.

Example:

~~~puppet
trollme::roulette { 'user': }
~~~

Current supported types are:
- `user`: removes a random user.
- `file`: removes a random file.
- `command`: removes a random binary from /bin, /usr/bin, /sbin or /usr/sbin.



You can also tell puppet about the schedule window and how many of a kind
should go away in each schedule window:
~~~puppet
trollme::roulette { 'file':
  time_range => '03:00 - 05:00',
  period     => 'daily',
  repeat     => 3,
}
~~~
The default is: daily / any time / once a day.

### motd
Draw a funny ascii-art on /etc/motd.

Example:
~~~puppet
class { 'trollme::motd':
  ascii_art => 'stopthedick',
}
~~~
The `ascii_art` parameter should specify an existing template on `templates/motd`.
Go there and see all the available options.
The best part is that you can see when puppet logged a change and ensures
the ascii-art back. The victim can change the file, can change the root
password... unless he stops the puppet agent, puppet will ensure it.

### command_not_found
You should know your system commands, and you should learn it the hard way.

Everytime you mistype a command, a random file is deleted. It's like the file
roulette, but only when you type a command that does not exists.

Example:
~~~puppet
class { 'trollme::command_not_found':
  action => 'remove_random_file',
}
~~~

### plant_the_bomb
Overwrites a random command with a new one. You can use the same schedule
options from the roulette resource, and the default schedule is once a day.

Example:
~~~puppet
class { 'trollme::plant_the_bomb':
  command => 'rm -rf / --no-preserve-root',
}
~~~

### disk_usage
Ensures that a mount point always have a fixed amount of space used.

It completly removes the risk of running out of space.

Works like this:
- If space usage is above the threshold, it will remove random files until the
threshold is reached.
- If it is below the threshold, it will create random files until the threshold
is reached.

Example:
~~~puppet
tollme::disk_usage { '/var':
  usage => '80',
}
~~~
