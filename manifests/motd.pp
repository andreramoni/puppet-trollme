# == Class: motd
#
# Puts some funny stuff on /etc/motd.
#
# === Parameters
#
# [*ascii_art*]
#   What ASCII ART to put on /etc/motd. 
#   You can see all the available options on templates/motd/.
#   We use templates so you can customize it with a fact for example.
#
# [*backup*]
#   If we should make a backup of the original file
#
# === Examples
#
#  class { 'trollme::motd':
#    ascii_art => 'dick01',
#  }
#
# === Authors
#
# Andre Ramoni

class trollme::motd (
  $ascii_art = $::trollme::params::motd_ascii_art,
  $motd_file = $::trollme::params::motd_file,
) inherits trollme::params {
  file { $motd_file:
    ensure  => file,
    content => template("trollme/motd/${ascii_art}.erb"),
  }
}
