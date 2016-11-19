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
# === Examples
#
#  class { 'trollme::motd':
#    ascii_art => 'stopthedick',
#  }
#
# === Authors
#
# Andre Ramoni
#

class trollme::motd (
  $ascii_art = $::trollme::params::motd_ascii_art,
  $file      = $::trollme::params::motd_file,
) inherits trollme::params {
  require trollme
  file { $file:
    ensure  => file,
    content => template("trollme/motd/${ascii_art}.erb"),
  }
}
